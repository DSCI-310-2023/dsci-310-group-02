# Author: Kashish Joshipura
# Date: 10-03-2023

#' Summarize the data
#'
#' Creates a new data frame with three columns 
#' (mean, median and standard deviation) 
#' calculated from a particular column 
#' of a data frame.
#'
#' @param file_path_url A string with the URL or path to the file.
#' @param col A string with the quoted name of the column to summarize.
#'
#' @return A data frame with three columns 
#'   (median, mean and standard deviation).
#'
#' @export
#'
#' @examples
#' data_summary_fun("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv","alcohol")
#' 

library(tidyverse)

data_summary <- function(file_path_url, col) {
  data <- read_delim(file_path_url, ";")
  new_names <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar","chlorides", "free_sulfur_dioxide", 
                 "total_sulfur_dioxide", "density","pH", "sulphates", "alcohol", "quality")
  data <- rename(data, !!!setNames(names(data), new_names))
  
  # Check if selected column exists
  if (!(col %in% names(data))) {
    stop(paste("Column", col, "does not exist"))
  }
  
  # Check if selected column is numeric or not
  if (!is.numeric(data[[col]])) {
    stop(paste("Column", col, "not numeric"))
  }
  
  data_mean <- mean(data[[col]], na.rm = TRUE)
  data_median <- median(data[[col]], na.rm = TRUE)
  data_sd <- sd(data[[col]], na.rm = TRUE)
  data_new <- tibble(data_mean, data_median, data_sd)
  data_new <- rename(data_new,!!!setNames(names(data_new), c("mean", "median", "standard_deviation")))
  return(data_new)
}


