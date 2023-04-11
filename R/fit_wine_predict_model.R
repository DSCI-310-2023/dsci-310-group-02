"
Fit a knn model on the pre-processed data and use the best k-neighbour to
build the classification model.

Usage: R/fit_wine_predict_model.R --train=<train> --out_dir=<out_dir>

Options:
--train=<train>       Path (including filename) to training data
--out_dir=<out_dir>   Path to directory where the erialized model should be written
" -> doc

library(tidyverse)
library(tidymodels)
library(kknn)
library(docopt)
library(wineclassify)
set.seed(5678)

opt <- docopt(doc)
main <- function(train, out_dir){
  train_data <- read.csv(train, sep=",")
  train_df <- as.data.frame(train_data)

  # Make a 10-fold cross validation for wine quality training data set
  recipe <- recipe(quality ~ . , data = train_df)%>%
    step_center(all_predictors()) %>%
    step_scale(all_predictors())

  # build the model
  final_model <- model_build(train_df, recipe, "quality")
  
  # save the fitted model
  saveRDS(final_model, file = paste0(out_dir, "/final_model.rds"))
}

main(opt[["--train"]], opt[["--out_dir"]])
