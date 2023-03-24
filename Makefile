# White Wine Analysis
# Author: Peter, Eric and Kashish
# Date: March 24th, 2023

all: results/count_plot.png results/ggpairs_plot.png results/k_plot.png

#Loading the dataset
data/winequality-white.csv:	R/data_load.R
	Rscript R/data_load.R --url=https://raw.githubusercontent.com/kashish1928/dsci-310-group-02/main/data/winequality-white.csv --out_dir=data/winequality-white.csv

#Splitting and training the data
data/training_data.csv tests/testthat/test-data_split.R:	R/data_split.R data/winequality-white.csv
	Rscript R/data_split.R --raw=data/winequality-white.csv --out_dir=results/

#Fitting the data for the predict model

#Graphing the data

#Rendering the report
notebooks/white_wine_analysis.html notebooks/white_wine_analysis.pdf: notebooks/white_wine_analysis.rmd
	Rscript -e "rmarkdown::render('notebooks/white_wine_analysis.rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"

clean: 
	rm -rf data
	rm -rf results
	rm -rf notebooks/white_wine_analysis.html notebooks/white_wine_analysis.rmd
