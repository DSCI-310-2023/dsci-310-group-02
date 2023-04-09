set.seed(123)
source("../../R/data_summary")

# importing necessary libraries
library(testthat)
library(tidyverse)
library(tidymodels)

source("../../R/data_sum.R")
datasum = data_sum(data(mtcars))
