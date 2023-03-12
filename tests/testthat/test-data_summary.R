# Author: Kashish Joshipura
# Date: 10-03-2023

source("../../R/data_summary.R")

#importing the library testthat
library(testthat)

test_that("data_summary returns the correct median", {
  
  # Call function with data file path
  actual_output <- data_summary("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv","alcohol")
  
  # Test that actual output matches expected output
  expect_equal(actual_output$median, 10.2)
  
})
