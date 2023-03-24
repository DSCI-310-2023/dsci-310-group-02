# White Wine Analysis
# Author: Peter, Eric and Kashish
# Date: March 24th, 2023

all: results/count_plot.png ggpairs_plot.png k_plot.png

#Loading the dataset
data/winequality-white.csv: R/data_load.R
  Rscript R/data_load.R

#Splitting and training the data
data/training_data.csv tests/testthat/test-data_split.R: data/data/winequality-white.csv R/data_split.R
  Rscript data_split.R
  
#Fitting the data for the predict model

#Graphing the data

#Rendering the report
notebooks/white_wine_analysis.rmd: 
 

clean: 
  rm -rf data
  rm -rf results
  rm -rf notebooks/white_wine_analysis.html notebooks/white_wine_analysis.rmd
