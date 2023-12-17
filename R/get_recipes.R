#' Filter Recipes Based on Various Criteria
#'
#' This function filters the recipes dataset based on provided criteria such as ingredients,
#' cuisine, diet, maximum preparation time, and maximum cooking time.
#'
#' @param data Data frame containing the recipes.
#' @param ingredients Vector of ingredients for filtering (optional).
#' @param cuisine String specifying the cuisine type for filtering (optional).
#' @param diet String specifying the diet type for filtering (optional).
#' @param prep_time_max Numeric value for maximum preparation time in minutes (optional).
#' @param cook_time_max Numeric value for maximum cooking time in minutes (optional).
#' @return A data frame of filtered recipes.
#' @examples
#' get_recipes(data, ingredients = c("tomato", "chicken"),
#'            cuisine = "Italian", diet = "Gluten Free",
#'            prep_time_max = 30, cook_time_max = 60)
#' @export
get_recipes <- function(data, ingredients = NULL, cuisine = NULL, diet = NULL, prep_time_max = Inf, cook_time_max = Inf) {
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

  # Filter by prep time if provided
  if (!is.null(prep_time_max)) {
    data <- data[data$prep_time <= prep_time_max, ]
  }

  # Filter by cook time if provided
  if (!is.null(cook_time_max)) {
    data <- data[data$cook_time <= cook_time_max, ]
  }

  return(data)
}

}
