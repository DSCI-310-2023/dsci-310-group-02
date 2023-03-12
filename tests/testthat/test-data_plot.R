source("./data_plot.R")

library(ggplot2)
library(testthat)

file_path <- "../data/cleaned_data.csv"

# test the function
test_that("data_plot fun returns the correct plots", {
  p <- count_plot(file_path)
  expect_true(is.ggplot(p))
})
