# Author: Eric HUANG
# Date: 12-03-2023

source("../R/data_summary.R")

library(testthat)

test_that("data_sum returns the identical summary of the specified data frame", {
  expect_identical(data_sum("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"), datasum)
})

test_that("data_sum returns the identical summary of the another specified data frame", {
  expect_identical(data_sum("https://projects.fivethirtyeight.com/polls-page/president_primary_polls.csv"), datasum2)
})

test_that("data_sum returns nothing when given an empty dataframe", {
  expect_identical(typeof(data_sum("")), typeof("character"))
})

test_that("data_sum returns nothing when given an empty dataframe", {
  expect_warning(data_sum())
})
