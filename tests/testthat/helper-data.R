set.seed(123)
source("../../R/data_load.R")

# importing necessary libraries
library(testthat)
library(tidyverse)
library(tidymodels)

data = data(mtcars)
# splitting it into training 75% and testing 25% 
split <- initial_split(data, prop = 0.75, strata = quality)
train <- training(split)

datasummary= data_load(data)

datasummary2= data_load("https://projects.fivethirtyeight.com/polls-page/president_primary_polls.csv", ",")
