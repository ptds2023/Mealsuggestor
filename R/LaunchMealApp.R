#' Launch Meal Suggestor Shiny App
#'
#' This function starts the Meal Suggestor Shiny application contained within the package.
#' It assumes that the Shiny app's UI and server logic are defined in an external script named 'app.R'.
#'
#' @importFrom shiny runApp
#' @export
#'
#' @examples
#' launchMealApp()
launchMealApp <- function() {
  appDir <- "~/Mealsuggestor/App"
  if (file.exists(appDir)) {
    shiny::runApp(appDir)
  } else {
    stop("App directory not found in package.")
  }
}

