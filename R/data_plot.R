"
Create a histogram of categorical variables and a ggpairs plot for the cleaned data.
Save the plots as png files.

Usage: R/data_plot.R --input=<input> --out_dir=<out_dir>

Options:
--input=<input>       Path (including filename) to cleaned data 
--out_dir=<out_dir>   Path to directory where the training and test data should be written
" -> doc

library(dplyr)
library(ggplot2)
library(GGally)
library(docopt)
library(wineclassify)
opt <- docopt(doc)

# loading the dataset ----------------------------------------------------------
c_data <- read.csv(opt$input)
c_data_df <- as.data.frame(c_data)

# create a bar chart that counts categorical variables
categorical_distribution <- hist_plot(c_data_df, "quality")
  
# save the plot ----------------------------------------------------------------
ggsave(
  paste0(opt$out_dir, "/count_plot.png"), 
  categorical_distribution
)

# create a ggpairs plot --------------------------------------------------------
# matrix of plots
pairs <- corr_plot(c_data_df)

# save the plot ----------------------------------------------------------------
ggsave(
  paste0(opt$out_dir,  "/ggpairs_plot.png"), 
  pairs,
  width = 10, height = 10, dpi = 300
)
