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
  
  # Load the model and predict
  final_model <- readRDS("./results/final_model.rds")
  prediction <- predict(final_model, test_df)
  bind_cols(test_df)
  test_df$pred <- prediction$.pred_class
  test_df$quality <- as.factor(test_df$quality)
  
  # Assess model accuracy
  conf_matrix <- conf_mat(data = test_df, truth = quality, estimate = pred)
  saveRDS(conf_matrix, file = paste0(out_dir, "/final_model_quality.rds"))
}

main(opt[["--test"]], opt[["--out_dir"]])

