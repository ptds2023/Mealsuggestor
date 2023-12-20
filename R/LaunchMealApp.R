#' Launch Meal Suggestor Shiny App
#'
#' This function starts the Meal Suggestor Shiny application contained within the package.
#'
#' @importFrom shiny runApp
#' @export
#'
#' @examples
#' if (requireNamespace("shinythemes", quietly = TRUE)) {
#'   launchMealApp()
launchMealApp <- function() {
  appDir <- "~/Mealsuggestor/App"
  if (file.exists(appDir)) {
    shiny::runApp(appDir)
  } else {
    stop("App directory not found.")
  }
}
