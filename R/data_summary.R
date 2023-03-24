#' EDA the data
#'
#' Creates a summary of the given data
#' 
#'
#' @param file_path_url A string with URL or path to the file 
#' 
#' @return A summary of the given data through the R function of summary()
#' 
#' 
#' @examples
#' data_sum("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv")

  
library(tidyverse)

data_sum <- function(file_path_url){
  summary(data)
}

