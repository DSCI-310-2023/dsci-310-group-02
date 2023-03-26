"
Create a summary of the given data.

Usage: R/data_summary.R --input=<input> --out_dir=<out_dir>

Options:
--input=<input>       Path (including filename) to cleaned data 
--out_dir=<out_dir>   Path to directory where the summary data should be written
" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

main <- function(input, out_dir){
  data <- read.csv(input, sep=',')
  data_df <- as.data.frame(data)
  results <- summary(data_df)
  # write summary result to the file
  write.csv(results, paste0(out_dir, "/summary_data.csv"))
}

main(opt[["--input"]], opt[["--out_dir"]])

