"
Split the cleaned data into training and test data sets.
Write them to separate files for building model later.

Usage: R/data_split.R --input=<input> --out_dir=<out_dir>

Options:
--input=<input>       Path (including filename) to cleaned data 
--out_dir=<out_dir>   Path to directory where the training and test data should be written
" -> doc

library(tidyverse)
library(tidymodels)
library(docopt)
library(dplyr)

set.seed(123)

opt <- docopt(doc)
main <- function(input, out_dir){
  data <- read.csv(input, sep=",")
  data_df <- as.data.frame(data)
  
  # split into training and test data
  split <- initial_split(data_df, prop = 0.75, strata = quality)
  training_data <- training(split)
  test_data <- testing(split)
  
  # write the training and test data to files
  write_csv(training_data, paste0(out_dir, "/training_data.csv"))
  write_csv(test_data, paste0(out_dir, "/test_data.csv"))
}

main(opt[["--input"]], opt[["--out_dir"]])
