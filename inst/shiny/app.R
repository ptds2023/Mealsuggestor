library(dplyr)
library(shiny)


ui <- fluidPage(
  tags$head(
    tags$style(HTML("

           body {
                background-image: url('cooking_background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-color: #f7f7f7;
            }
            .panel {
                background-color: rgba(255, 255, 255, 0.5);
                border-radius: 5px;
            }
            .card {
                background-color: #ffffff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
                margin-bottom: 10px;
                padding: 10px;
                cursor: pointer;
            }
            .card:hover {
                box-shadow: 0 4px 8px rgba(0,0,0,.7);
            }
            .card-title {
                font-size: 18px;
                color: #333333;
                margin-bottom: 5px;
            }
            .card-text {
                font-size: 14px;
                color: #666666;
            }
            .card-highlight {
                font-weight: bold;
                color: #007bff;
            }
        "))
  ),
  titlePanel("Meal Suggestion App"),
  sidebarLayout(
    sidebarPanel(
      selectInput("cuisine", "Choose Cuisine:", choices = unique(recipes$cuisine)),
      selectInput("diet", "Choose Diet:", choices = unique(recipes$diet)),
      sliderInput("cookTime", "Maximum Cooking Time (minutes):", min = 0, max = 120, value = 30),
      actionButton("submit", "Get Suggestions", class = "btn-primary")
    ),
    mainPanel(
      class = "panel",
      uiOutput("suggestions")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  filteredData <- reactive({
    req(input$submit > 0)
    recipes %>%
      filter(cuisine == input$cuisine &
               diet == input$diet &
               cook_time <= input$cookTime) %>%
      mutate(rating = round(rating, 2)) %>%
      arrange(desc(rating)) %>%
      head(5)
  })

  output$suggestions <- renderUI({
    data <- filteredData()
    if (is.null(data) || nrow(data) == 0) {
      return(tags$p("No matching recipes for the selected criteria.", class = "no-recipes-message"))
    }
    recipeCards <- lapply(1:nrow(data), function(i) {
      recipe <- data[i, ]
      tags$div(class = "card", id = paste0("card_", i), onclick = sprintf("Shiny.setInputValue('selected_card', %d)", i),
               tags$h3(class = "card-title", recipe$recipe_title),
               tags$p(class = "card-text", "Cuisine: ", tags$span(class = "card-highlight", recipe$cuisine)),
               tags$p(class = "card-text", "Cook Time: ", tags$span(class = "card-highlight", paste(recipe$cook_time, "mins"))),
               tags$p(class = "card-text", "Rating: ", tags$span(class = "card-highlight", recipe$rating))
      )
    })
    do.call(tagList, recipeCards)
  })

  observeEvent(input$selected_card, {
    cardIndex <- input$selected_card
    if (!is.null(cardIndex)) {
      recipe <- filteredData()[cardIndex, ]
      showModal(modalDialog(
        title = recipe$recipe_title,
        tags$h4("Ingredients"),
        tags$p(recipe$ingredients),
        tags$h4("Instructions"),
        tags$p(recipe$instructions),
        easyClose = TRUE,
        footer = NULL
      ))
    }
  })
}



shinyApp(ui = ui, server = server)
