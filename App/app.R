library(shiny)
library(shinythemes)
library(htmltools)
library(Mealsuggestor)

cuisine_vec <- unique(recipes$cuisine)
diet_vec <- unique(recipes$diet)

mealApp <- function(){
  # Define UI
  ui <- fluidPage(
    theme = shinythemes::shinytheme("slate"),
    titlePanel("Meal Suggestor"),
    navbarPage("Meals", id = "navbar",
               tabPanel("Meal List",
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("cuisine", "Cuisine", choices = c("Choose" = "", cuisine_vec), selected = "Choose", multiple = FALSE),
                            selectInput("diet", "Diet", choices = c("Choose" = "", diet_vec), selected = "Choose"),
                            textInput("ingredient", "Enter an Ingredient", value = ""),
                            sliderInput("prepTimeRange", "Preparation Time (minutes):",
                                        min = 0, max = 120, value = c(10, 30), step = 5),
                            sliderInput("cookTimeRange", "Cooking Time (minutes):",
                                        min = 0, max = 120, value = c(15, 45), step = 5),
                            sliderInput("numTopRecipes", "Number of top recipes to display:",
                                        min = 1, max = 10, value = 5),
                            selectInput("sortField", "Sort by:",
                                        choices = list("Rating" = "rating",
                                                       "Preparation Time" = "prep_time",
                                                       "Cooking Time" = "cook_time"),
                                        selected = "rating"),
                            actionButton("clearButton", "Clear Selections"),
                            actionButton("randomRecipeButton", "I do not know what I want...", icon = icon("random"))),
                          mainPanel(
                            uiOutput("mealList"),
                            uiOutput("randomMealDetails")
                          )
                        )
               ),
               tabPanel("Meal Details",
                        mainPanel(
                          uiOutput("mealDetails")
                        )
               ),
               tabPanel("Information",
                        mainPanel(
                          h3("How to Use the Meal Suggestor"),
                          p("Welcome to the Meal Suggestor! Here's how you can use this app:"),
                          tags$ul(
                            tags$li("Select a cuisine from the 'Cuisine' dropdown."),
                            tags$li("Choose a diet preference from the 'Diet' dropdown."),
                            tags$li("Enter ingredients in the provided field."),
                            tags$li("Adjust preparation and cooking time using the sliders."),
                            tags$li("Click 'Surprise Me' for a random meal suggestion."),
                            tags$li("Use 'Clear Selections' to reset all inputs.")
                          ),
                          p("Dont ever be bored when you want to cook :)")
                        )
               )
    )
  )


  server <- function(input, output, session) {

    # Show welcome message when the app starts
    observe({
      showModal(modalDialog(
        title = "Welcome to Meal Suggestor!",
        "Explore a variety of meals based on your preferences. Get started by selecting options on the left.",
        easyClose = TRUE,
        footer = NULL
      ))
    })

    # Reactive expression to filter and sort recipes based on user input
    filteredRecipes <- reactive({
      # Using get_recipes for basic filtering by cuisine, diet, etc.
      basicFiltered <- get_recipes(data = recipes, cuisine = input$cuisine, diet = input$diet, ingredients = input$ingredient)

      # Further filtering by preparation and cooking time
      timeFiltered <- filter_by_time(data = basicFiltered,
                                     min_prep_time = input$prepTimeRange[1],
                                     max_prep_time = input$prepTimeRange[2],
                                     min_cook_time = input$cookTimeRange[1],
                                     max_cook_time = input$cookTimeRange[2])

      # Getting top n recipes
      topnrecipes <- get_top_n_recipes(data = timeFiltered, n = input$numTopRecipes)

      # Sorting the filtered data
      sort_recipes(data = topnrecipes, sort_by = input$sortField, ascending = FALSE)


    })

    # Dynamic UI for displaying filtered recipes
    output$mealList <- renderUI({
      meals <- filteredRecipes()

      # Check if any meals are found
      if (nrow(meals) > 0) {
        lapply(seq_len(nrow(meals)), function(i) {
          div(class = "meal-item",
              actionLink(inputId = paste("meal", i, sep = "_"), label = meals$recipe_title[i])
          )
        })
      } else {
        "No meals found based on your criteria."
      }
    })

    # Handle the random recipe button click
    observeEvent(input$randomRecipeButton, {
      randomMeal <- random_recipe(data = recipes)
      selectedMeal(randomMeal)
      output$randomMealDetails <- renderUI({
        if (!is.null(randomMeal)) {
          # Create UI elements to display the details
          h3(randomMeal$recipe_title)
          # Add more details as needed
        } else {
          "No random meal found."
        }
      })
    })

    observeEvent(input$clearButton, {
      # Reset the inputs to their default values
      updateSelectInput(session, "cuisine", selected = "Choose")
      updateSelectInput(session, "diet", selected = "Choose")
      updateTextInput(session, "ingredient", value = "")
      updateSliderInput(session, "prepTimeRange", value = c(10, 30))
      updateSliderInput(session, "cookTimeRange", value = c(15, 45))
      updateSliderInput(session, "numTopRecipes", value = 5)
      updateSelectInput(session, "sortField", selected = "rating")
      output$randomMealDetails <- renderUI({})
    })

    selectedMeal <- reactiveVal()

    observe({
      meals <- filteredRecipes()
      for (i in seq_len(nrow(meals))) {
        local({
          local_i <- i
          observeEvent(input[[paste("meal", local_i, sep = "_")]], {
            selectedMeal(meals[local_i, ])
          })
        })
      }
    })

    output$mealDetails <- renderUI({
      meal <- selectedMeal()
      if (!is.null(meal)) {
        instructions <- unlist(strsplit(meal$instructions, "\\|"))
        instructionList <- lapply(instructions, function(instr) {
          p(instr)
        })
        tagList(
          h3("Recipe Title: ", meal$recipe_title),
          h4("Cuisine: ", meal$cuisine),
          h4("Diet: ", meal$diet),
          h4("Preparation Time: ", meal$prep_time, " minutes"),
          h4("Cooking Time: ", meal$cook_time, " minutes"),
          h4("Ingredients:"),
          p(meal$ingredients),
          h4("Instructions:"),
          do.call(tagList, instructionList)
          # Add more meal details as needed
        )
      }
    })


  }
  shinyApp(ui, server)
}

mealApp()
