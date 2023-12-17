test_that("filter_by_time works correctly", {
  data <- tibble::tibble(prep_time = c(10, 20, 30, 40, 50), cook_time = c(5, 15, 25, 35, 45))
  result <- filter_by_time(data, max_prep_time = 30, max_cook_time = 20)
  expect_true(all(result$prep_time <= 30))
  expect_true(all(result$cook_time <= 20))
  expect_equal(nrow(result), 2)

