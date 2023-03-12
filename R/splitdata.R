#' Loading in the in data
#'
#' uses the read_delim function to be able 
#' to read the data in by seperating the data with ";"
#' and spilt the data into a training and testing dataset 
#' for setting up the knn recipe
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
    testing <- testing(split)
    return(training)
}

