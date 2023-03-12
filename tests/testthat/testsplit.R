# Author: Peter Lee
# Date: 10-03-2023

set.seed(123)
source("./splitdata.R")

# importing necessary libraries
library(testthat)
library(tidyverse)
library(tidymodels)

data = read_delim("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", ";")

# splitting it into training 75% and testing 25% 
split <- initial_split(data, prop = 0.75, strata = quality)
training <- training(split)
testing <- testing(split)


test_that("The training of the split data returns the same dataframe", {
  # comparing actual output with expected output 
  expect_identical(splitdata("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"), training)
})

