test_that("get_recipes filters correctly", {
  # Create a sample dataset
  data <- tibble::tibble(
    recipe_title = c("Recipe1", "Recipe2", "Recipe3"),
    cuisine = c("Italian", "French", "Italian"),
    diet = c("Vegan", "Vegetarian", "Gluten-Free"),
    rating = c(4.5, 4.7, 4.6)
  )

  # Test for a specific cuisine and diet
  result <- get_recipes(data, cuisine = "Italian", diet = "Vegan")
  expect_true(all(result$cuisine == "Italian"))
  expect_true(all(result$diet == "Vegan"))
  expect_equal(nrow(result), 1) # Expecting one result based on the criteria
})
