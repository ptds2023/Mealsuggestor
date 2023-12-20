#' Get Top N Rated Recipes
#'
#' This function retrieves the top N rated recipes from the dataset based on user ratings.
#'
#' @param data Data frame containing the recipes.
#' @param n The number of top-rated recipes to return.
#' @return A data frame containing the top N rated recipes.
#' @examples
#' get_top_n_recipes(data = recipes, n = 5)
#' @importFrom utils head
#' @export
get_top_n_recipes <- function(data, n = 5) {
  # Rating column in data
  top_n_recipes <- head(data[order(data$rating, decreasing = TRUE), ], n)
  return(top_n_recipes)
}
