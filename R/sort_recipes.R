#' Sort Recipes by Specified Criteria
#'
#' This function sorts recipes based on a specified column and order.
#'
#' @param data Data frame containing the recipes.
#' @param sort_by The column name to sort by (e.g., "rating", "prep_time").
#' @param ascending Boolean; if TRUE, sorts in ascending order, else in descending order.
#' @return A sorted data frame of recipes.
#' @examples
#' sort_recipes(data = recipes, sort_by = "rating", ascending = FALSE)
#' @export
sort_recipes <- function(data, sort_by, ascending = TRUE) {
  if (ascending) {
    sorted_data <- data[order(data[[sort_by]]), ]
  } else {
    sorted_data <- data[order(-data[[sort_by]]), ]
  }

  return(sorted_data)
}

