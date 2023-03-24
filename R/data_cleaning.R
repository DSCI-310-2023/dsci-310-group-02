# Author: Eric Huang
# Date: 2023-03-23

"
Pre-process the data including remove the spaces in names, labeling the
quality as catergorical values.

Usage: R/data_cleaning.R --input=<input> --out_dir=<out_dir>

Options:
--input=<input>       Path (including filename) to raw data (feather file)
--out_dir=<out_dir>   Path to directory where the processed data should be written
" -> doc

library(tidyverse)
library(docopt)
library(dplyr)

opt <- docopt(doc)
main <- function(input, out_dir){
  raw_data <- read.csv(input, sep=";")
  raw_data_df <- as.data.frame(raw_data)
  
  # Categorize the quality
  raw_data_df <- 
    raw_data_df %>%
    mutate(
      quality = case_when(
      quality >= 7 ~ "Great",
      quality >= 5 & quality < 7 ~ "Avergae",
      quality >= 1 & quality < 5 ~ "Unsatisfactory",
      TRUE ~ NA_character_
      )
    )
  
  # write the cleaned data to file for plotting
  write_csv(raw_data_df, paste0(out_dir, "/cleaned_data.csv"))
}

main(opt[["--input"]], opt[["--out_dir"]])
