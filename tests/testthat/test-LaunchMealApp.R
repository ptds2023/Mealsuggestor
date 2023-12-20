test_that("launchMealApp behaves correctly", {
  # Test when the app directory does not exist
  expect_error(
    launchMealApp(),
    "App directory not found."
  )
})
