#' Cleaning the data
#'
#' 1.Remove the spaces in the column names
#' 2.Label the white wine quality as categorical values and 
#' set them as the factor
#' 3.Set each column as a double expect quality column
#'
#' @param file_path_url A string with URL or path to the file 
#' 
#' @return A cleaned data frames with original columns and
#' a new column "quality"
#' 
#' @export cleaned_data.csv The cleaned data frame for visualization
#' 
#' @examples
#' data_cleaning("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv")

  
library(tidyverse)

data_cleaning <- function(file_path_url){
  data <- read_delim(file_path_url, ";")
  
  # cleaning data
  new_names <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "pH", "sulphates", "alcohol", "quality")
  data <- rename(data, !!!setNames(names(data), new_names))
  
  data$quality <- as.integer(data$quality)
  data$fixed_acidity<- as.double(data$fixed_acidity)
  data$volatile_acidity<- as.double(data$volatile_acidity)
  data$citric_acid<- as.double(data$citric_acid)
  data$residual_sugar<- as.double(data$residual_sugar)
  data$free_sulfur_dioxide<- as.double(data$free_sulfur_dioxide)
  data$total_sulfur_dioxide<- as.double(data$total_sulfur_dioxide)
  data$chlorides<- as.double(data$chlorides)
  data$density<- as.double(data$density)
  data$pH<- as.double(data$pH)
  data$sulphates<- as.double(data$sulphates)
  data$alcohol<- as.double(data$alcohol)
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

  write_csv(data, paste0("../data", "/cleaned_data.csv"))
  return(data)
}

