set.seed(123)
source("../../R/data_load.R")

# importing necessary libraries
library(testthat)
library(tidyverse)
library(tidymodels)

data = read_delim("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", ";")

# splitting it into training 75% and testing 25% 
split <- initial_split(data, prop = 0.75, strata = quality)
train <- training(split)

datasummary= data_load("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv")

datasummary2= data_load("https://projects.fivethirtyeight.com/polls-page/president_primary_polls.csv", ",")
