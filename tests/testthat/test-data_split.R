# Author: Peter Lee
# Date: 10-03-2023

set.seed(123)
source("R/data_split.R")



test_that("The training of the split data returns the same dataframe", {
  # comparing actual output with expected output 
  expect_identical(splitdata("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"), train)
})

