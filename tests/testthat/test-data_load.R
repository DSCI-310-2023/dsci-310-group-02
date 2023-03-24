# Author: Kashish Joshipura
# Date: 10-03-2023

source("../../R/data_load.R")

#importing the library testthat
library(testthat)

test_that("data_load returns the correct dataframe", {
  # Test that actual output matches expected output
  expect_equal(data_load("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv",";"), datasummary)
  
})

test_that("Entering an empty dataset", {
  expect_error(data_load(data.frame(), " "), "")
})

test_that("data_load returns the correct dataframe", {
  # Test that actual output matches expected output
  expect_equal(data_load("https://projects.fivethirtyeight.com/polls-page/president_primary_polls.csv",","), datasummary2)
  
})
