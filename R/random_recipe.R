#' Select a Random Recipe
#'
#' This function selects a random recipe from the datase to suprise the customer
#'
#' @param data Data frame containing the recipes.
#' @return A single randomly selected recipe.
#' @examples
#' random_recipe(data = recipes)
#' @export
random_recipe <- function(data) {
  random_row <- sample(nrow(data), 1)
  return(data[random_row, ])
}
