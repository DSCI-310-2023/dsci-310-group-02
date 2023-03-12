set.seed(123)
source("./splitdata.R")

library(testthat)
library(tidyverse)
library(tidymodels)

data = read_delim("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", ";")
split <- initial_split(data, prop = 0.75, strata = quality)
training <- training(split)
testing <- testing(split)


test_that("The training of the split data returns the same dataframe", {
  expect_identical(splitdata("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"), training)
})

