# Author: Eric HUANG
# Date: 12-03-2023

source("../R/data_cleaning.R")

library(testthat)

data = read_delim("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", ";")
data$quality <- as.integer(data$quality)
data$quality[data$quality==1] = "unsatisfactory"
data$quality[data$quality==2] = "unsatisfactory"
data$quality[data$quality==3] = "unsatisfactory"
data$quality[data$quality==4] = "unsatisfactory"
data$quality[data$quality==5] = "average"
data$quality[data$quality==6] = "average"
data$quality[data$quality==7] = "Great"
data$quality[data$quality==8] = "Great"
data$quality[data$quality==9] = "Great"
data$quality = as.factor(data$quality)
table_qual <- table(data$quality)

test_that("data_cleaning returns the correct cleaned data frame", {
  expect_identical(data_cleaning("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"), table_qual)
})