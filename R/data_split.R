# Author: Peter Lee
# Date: 10-03-2023
#'
#'
#' Splitting the data
#' Spilts the data into a training and testing dataset into 75% training and 25% testing
#' that is used for setting up the knn recipe later. Check if the splitting of the training dataset
#' is split with the correct seed and the correct data 
#'
#' @param file_path A string with the URL or path to the file.
#'
#' @return the training data from the specified file
#' 
#' @examples
#' data_summary_fun("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv")
#' 


library(tidyverse)
library(tidymodels)
splitdata <- function(file_path) {
    set.seed(123)
    data = read_delim(file_path, ";")
    split <- initial_split(data, prop = 0.75, strata = quality)
    training <- training(split)
    return(head(training))
}

