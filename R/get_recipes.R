#' Filter Recipes Based on Various Criteria
#'
#' This function filters the recipes dataset based on provided criteria such as ingredients,
#' cuisine, diet, maximum preparation time, and maximum cooking time.
#'
#' @param data Data frame containing the recipes.
#' @param ingredients Vector of ingredients for filtering
#' @param cuisine String specifying the cuisine type for filtering
#' @param diet String specifying the diet type for filtering
#' @return A data frame of filtered recipes.
#' @examples
#' get_recipes(data, ingredients = c("tomato", "chicken"),
#'            cuisine = "Italian", diet = "Gluten Free")
#' @export
get_recipes <- function(data, ingredients = NULL, cuisine = NULL, diet = NULL) {
  # Filter by ingredients
  if (!is.null(ingredients)) {
    data <- data[grepl(paste(ingredients, collapse = "|"), data$ingredients), ]
  }

  # Filter by cuisine
  if (!is.null(cuisine)) {
    data <- data[data$cuisine == cuisine, ]
  }

  # Filter by dietd
  if (!is.null(diet)) {
    data <- data[data$diet == diet, ]
  }

  return(data)
}

