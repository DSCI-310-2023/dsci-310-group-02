# White Wine Analysis
# Author: Peter, Eric and Kashish
# Date: March 24th, 2023

all: 

	make clean
	make preliminary-analysis
	make actual-analysis
	make report



.PHONY: preliminary-analysis
preliminary-analysis: data/raw_data.csv data/cleaned_data.csv results/summary_data.csv results/count_plot.png results/ggpairs_plot.png data/training_data.csv data/test_data.csv tests/testthat/test-data_split.R
# Loading the dataset
data/raw_data.csv:	R/data_load.R
	Rscript R/data_load.R --url=https://raw.githubusercontent.com/kashish1928/dsci-310-group-02/main/winequality-white.csv --out_dir=data

# Pre-process the dataset
data/cleaned_data.csv: R/data_cleaning.R data/raw_data.csv
	Rscript R/data_cleaning.R --input=data/raw_data.csv --out_dir=data

# Summarizing the dataset
results/summary_data.csv: R/data_summary.R data/cleaned_data.csv
	Rscript R/data_summary.R --input=data/cleaned_data.csv --out_dir=results

# Graphing the data
results/count_plot.png results/ggpairs_plot.png: R/data_plot.R data/cleaned_data.csv
	Rscript R/data_plot.R --input=data/cleaned_data.csv --out_dir=results

# Splitting and training the data
data/training_data.csv data/test_data.csv tests/testthat/test-data_split.R: R/data_split.R data/cleaned_data.csv
	Rscript R/data_split.R --input=data/cleaned_data.csv --out_dir=data


.PHONY: actual-analysis
actual-analysis: results/k_plot.png results/final_model.rds results/final_model_quality.rds

# Fitting the data for the predict model
results/final_model.rds: R/fit_wine_predict_model.R data/training_data.csv
	Rscript R/fit_wine_predict_model.R --train=data/training_data.csv --out_dir=results

# Testing model
results/final_model_quality.rds: R/wine_test_results.R data/test_data.csv
	Rscript R/wine_test_results.R --test=data/test_data.csv --out_dir=results


#generate html report of the analysis
.PHONY: report
report: 
	Rscript -e "rmarkdown::render('notebooks/white_wine_analysis.rmd', 'bookdown::html_document2')"

# Delete data,plots and html version of the analysis
.PHONY: clean
clean: 
	rm -rf data/*.csv
	rm -rf results/*.csv
	rm -rf results/count_plot.png
	rm -rf results/ggpairs_plot.png
	rm -rf results/*.rds
	rm -rf notebooks/white_wine_analysis.html
