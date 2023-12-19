test_that("random_recipe returns a single recipe", {
  data <- tibble::tibble(recipe_title = c("Recipe1", "Recipe2", "Recipe3"),
                         rating = c(4.5, 4.7, 4.6))
  result <- random_recipe(data)
  expect_true(nrow(result) == 1)
  expect_true(result$recipe_title %in% data$recipe_title)
})
