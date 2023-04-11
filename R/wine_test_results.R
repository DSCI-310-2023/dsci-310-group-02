"
Assess model's accuracy on a test data set.
Usage: R/wine_test_results.R --test=<train> --out_dir=<out_dir>
Options:
--train=<train>       Path (including filename) to test data
--out_dir=<out_dir>   Path to directory where the plots should be saved
" -> doc
library(devtools)
library(tidyverse)
library(docopt)
library(workflows)
library(yardstick)
library(tidyr)
library(wineclassify)
set.seed(5678)

opt <- docopt(doc)
main <- function(test, out_dir){
  # Load the test data
  test_data <- read.csv(test, sep=",")
  test_df <- as.data.frame(test_data)
  final_model <- readRDS("./results/final_model.rds")
  
  # evaluate the model 
  conf_matrix <- model_results(test_df, final_model, "quality")
  
  # save the confusion matrix
  saveRDS(conf_matrix, file = paste0(out_dir, "/final_model_quality.rds"))
}

main(opt[["--test"]], opt[["--out_dir"]])

