#' Launch the Meal Suggestor App
#'
#'This function starts the Meal Suggestor Shiny application, providing users
#'with a user-friendly interface to get personalized meal suggestions based
#'on their preferences and dietary requirements.
#'
#' @return
#' @export
#'
#' @examples
#' To launch the Meal Suggestor application:
launchApp <- function() {
  mealapp <- system.file("shiny", package = "Mealsuggestor")
  shiny::runApp(mealapp)
}
