library(shiny)
library(Mealsuggestor)

ui <- fluidPage(
  titlePanel("Recipe Finder"),
  sidebarLayout(
    sidebarPanel(
      selectInput("cuisine", "Choose Cuisine:", choices = c("Italian", "French", "American")), # Update choices
      selectInput("diet", "Choose Diet:", choices = c("Vegan", "Vegetarian", "None")), # Update choices
      numericInput("n", "Number of Recipes:", 5),
      actionButton("submit", "Search")
    ),
    mainPanel(
      tableOutput("results")
    )
  )
)

server <- function(input, output) {
  results <- eventReactive(input$submit, {
    get_recipes(cuisine = input$cuisine, diet = input$diet, n = input$n) #put here (data=recipes) to use it as an argument
  })

  output$results <- renderTable({
    results()
  })
}

shinyApp(ui = ui, server = server)
