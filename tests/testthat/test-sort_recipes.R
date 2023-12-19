test_that("sort_recipes sorts correctly", {
  data <- tibble::tibble(
    recipe_title = c("Recipe1", "Recipe2", "Recipe3"),
    rating = c(4.5, 4.7, 4.6)
  )

  result_asc <- sort_recipes(data, sort_by = "rating", ascending = TRUE)
  expect_equal(result_asc$recipe_title, c("Recipe1", "Recipe3", "Recipe2"))  # Sorted ascending

  result_desc <- sort_recipes(data, sort_by = "rating", ascending = FALSE)
  expect_equal(result_desc$recipe_title, c("Recipe2", "Recipe3", "Recipe1"))  # Sorted descending
})
