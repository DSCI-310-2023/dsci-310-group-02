"
Download the data csv from the web to the local filepath 
as a csv file format.

Usage: R/data_load.R --url=<url> --out_dir=<out_dir>

Options:
--url=<url>           URL from where to download the data
--out_dir=<out_dir>   Path(including filename) of where to write the file locally
" -> doc

library(tidyverse)
library(docopt)
library(wineclassify)

opt <- docopt(doc)
main <- function(url, out_dir) {
  data <- data_load(url, ";")
  write_csv(data, paste0(out_dir, "/raw_data.csv"))
}

main(opt[["--url"]], opt[["--out_dir"]])
