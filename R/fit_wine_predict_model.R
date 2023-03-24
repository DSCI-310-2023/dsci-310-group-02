"
Fits a knn modl on the pre-processed data and use the best k-neighbour to
build the classification model

Usage: R/fit_wine_predict_model.R --train=<train> --out_dir=<out_dir>

Options:
--train=<train>       Path (including filename) to training data
--out_dir=<out_dir>   Path to directory where the erialized model should be written
" -> doc

library(tidyverse)
library(tidymodels)
library(kknn)
library(docopt)
set.seed(5678)

opt <- docopt(doc)
main <- function(train, out_dir){
  train_data <- read.csv(train, sep=",")
  train_df <- as.data.frame(train_data)

  # Make a 10-fold cross validation for wine quality training data set
  recipe <- recipe(quality ~ . , data = train_df)%>%
    step_center(all_predictors()) %>%
    step_scale(all_predictors())

  vfold <- vfold_cv(train_df, v = 10, strata = quality)
  knn_tune <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
    set_engine("kknn") %>%
    set_mode("classification")
  
  # Set up the workflow for the knn fold
  knn_results <- workflow() %>%
    add_recipe(recipe) %>%
    add_model(knn_tune) %>%
    tune_grid(resamples = vfold, grid = 20) %>%
    collect_metrics()

  # Find the most accurate K value
  accuracies <- knn_results %>% 
    filter(.metric == "accuracy")

  accurate_k <- accuracies %>% filter(mean == max(mean)) %>% slice(1)
  k <- accurate_k %>% pull(neighbors)
  
  # Use the most accurate K value to then build our Classification Model
  spec <- nearest_neighbor(weight_func = "rectangular", neighbors = k) %>%
    set_engine("kknn") %>%
    set_mode("classification")
  
  final_model <- workflow() %>%
    add_recipe(recipe) %>%
    add_model(spec) %>%
    fit(data = data)
  
  saveRDS(final_model, file = paste0(out_dir, "final_model.rds"))
}

main(opt[["--train"]], opt[["--out_dir"]])
