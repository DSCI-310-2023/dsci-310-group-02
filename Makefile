# White Wine Analysis
# Author: Peter, Eric and Kashish
# Date: March 24th, 2023

all: results/final_model.rds results/count_plot.png results/ggpairs_plot.png results/k_plot.png

# Loading the dataset
data/raw_data.csv:	R/data_load.R
	Rscript R/data_load.R --url=https://raw.githubusercontent.com/kashish1928/dsci-310-group-02/main/data/winequality-white.csv --out_dir=data

# Pre-process the dataset
data/cleaned_data.csv: R/data_cleaning.R data/raw_data.csv
	Rscript data_cleaning.R --input=data/raw_data.csv --out_dir=data

# Graphing the data
results/count_plot.png results/ggpairs_plot.png: R/data_plot.R data/cleaned_data.csv
	Rscript R/data_plot.R --input=data/cleaned_data.csv --out_dir=results

# Splitting and training the data
data/training_data.csv data/test_data.csv tests/testthat/test-data_split.R: R/data_split.R data/cleaned_data.csv
	Rscript R/data_split.R --input=data/cleaned_data.csv --out_dir=data

# Fitting the data for the predict model
results/final_model.rds: R/fit_wine_predict_model.R data/training_data.csv
	Rscript R/fit_wine_predict_model.R --train=data/training_data.csv --out_dir=results

# Rendering the report
notebooks/white_wine_analysis.html notebooks/white_wine_analysis.pdf: notebooks/white_wine_analysis.rmd
	Rscript -e "rmarkdown::render('notebooks/white_wine_analysis.rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"

clean: 
	rm -rf data
	rm -rf results
	rm -rf notebooks/white_wine_analysis.html notebooks/white_wine_analysis.rmd
