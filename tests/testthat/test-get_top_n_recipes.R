test_that("get_top_n_recipes returns top n recipes", {
  data <- tibble::tibble(
    recipe_title = c("Recipe1", "Recipe2", "Recipe3"),
    rating = c(4.5, 4.7, 4.6)
  )

  result <- get_top_n_recipes(data, n = 2)
  expect_equal(nrow(result), 2)
  expect_equal(result$recipe_title, c("Recipe2", "Recipe3"))  # Assuming these have the highest ratings
})
