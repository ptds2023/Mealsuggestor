library(shiny)
library(shinythemes)
library(htmltools)
#library(Mealsuggestor)

cuisine_vec <- unique(recipes$cuisine)
diet_vec <- unique(recipes$diet)

mealApp <- function(){
  # Define UI
  ui <- fluidPage(
    theme = shinythemes::shinytheme("superhero"),
    titlePanel("Meal Suggestor"),
    navbarPage("Meals", id = "navbar",
               tabPanel("Meal List",
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("cuisine", "Cuisine", choices = c("Choose" = "", cuisine_vec), selected = "Choose", multiple = FALSE),
                            selectInput("diet", "Diet", choices = c("Choose" = "", diet_vec), selected = "Choose"),
                            actionButton("clearButton", "Clear Selections"),
                            actionButton("surpriseMeButton", "Surprise Me", icon = icon("random")),
                            radioButtons("radio_time", "Prep/Cook Time",
                                         c("Short" = "short",
                                           "Medium" = "medium",
                                           "Long" = "long"))
                          ),
                          mainPanel(
                            uiOutput("mealList")
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
                          # Instructions and details
                        )
               )
    )
    # Additional JavaScript if needed
  )
  # Server logic


server <- function(input, output) {
  results <- eventReactive(input$submit, {
    get_recipes(cuisine = input$cuisine, diet = input$diet, n = input$n) #put here (data=recipes) to use it as an argument
  })

  output$results <- renderTable({
    results()
  })
}
shinyApp(ui, server)
}

mealApp()
