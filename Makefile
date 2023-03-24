# White Wine Analysis
# Author: Peter, Eric and Kashish
# Date: March 24th, 2023

all: results/count_plot.png ggpairs_plot.png k_plot.png

#download data

#Splitting and training the data
data/training_data.csv tests/testthat/test-data_split.R: R/


