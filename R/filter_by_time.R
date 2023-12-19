#' Filter Recipes by Preparation and Cooking Time
#'
#' This function filters recipes based on specified minimum and maximum preparation and cooking times.
#'
#' @param data Data frame containing the recipes.
#' @param min_prep_time Minimum allowed preparation time in minutes (default is 0).
#' @param max_prep_time Maximum allowed preparation time in minutes (default is Inf).
#' @param min_cook_time Minimum allowed cooking time in minutes (default is 0).
#' @param max_cook_time Maximum allowed cooking time in minutes (default is Inf).
#' @return A data frame of recipes filtered by the specified time constraints.
#' @examples
#' filter_by_time(data = recipes, min_prep_time = 10, max_prep_time = 30,
#'                min_cook_time = 20, max_cook_time = 60)
#' @export
filter_by_time <- function(data, min_prep_time = 0, max_prep_time = Inf,
                           min_cook_time = 0, max_cook_time = Inf) {
  # Filter for preparation time
  data <- data[data$prep_time >= min_prep_time & data$prep_time <= max_prep_time, ]

  # Filter for cooking time
  data <- data[data$cook_time >= min_cook_time & data$cook_time <= max_cook_time, ]

  return(data)
}

