source("../../R/data_summary.R")

library(testthat)

test_that("data_summary_fun returns the correct median", {
  
  # Call function with example data file path
  actual_output <- data_summary_fun("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv","alcohol")
  
  # Test that actual output matches expected output
  expect_equal(actual_output$median, 10.2)
  
})
