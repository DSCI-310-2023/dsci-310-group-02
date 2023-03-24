# Author: Kashish Joshipura
# Date: 10-03-2023

#' Loading in the data
#'
#' Creates a new data frame by loading in the data 
#' with the specified delimnator
#' then it returns the data as a new dataframe
#'
#' @param file_path_url A string with the URL or path to the file.
#' @param col A string with the quoted name of the column to summarize.
#'
#' @return A data frame 
#'
#' @export
#'
#' @examples
#' data_summary_fun("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv","alcohol")
#' 

library(tidyverse)

data_load <- function(file_path_url, col) {
  data <- read_delim(file_path_url, ";")
  return(data)
}


