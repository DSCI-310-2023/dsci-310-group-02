"
Create eda plots and ggpairs plots for the cleaned data.
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

opt <- docopt(doc)
main <- function(input, out_dir){
  # create a bar chart
  c_data <- read.csv(input)
  c_data_df <- as.data.frame(c_data)

  options(repr.plot.width = 12, repr.plot.height = 8)
  
  grp_df <- c_data_df %>% group_by(quality)

  quality_distribution <- grp_df %>% 
    ggplot(mapping = (aes(x = quality, fill = quality))) +
    geom_bar() +
    labs(x = "Wine Wine Quality", y = "Number of Occurances", fill = "Wine Category") +
    ggtitle("Total Count of White Wine Quality")
  
  # save the plot
  ggsave(
    paste0("../results", "/count_plot.png"), 
    quality_distribution
  )

  # create a ggpairs plot
    pairs <- ggpairs(c_data_df) +
      theme(text = element_text(size = 8))
  
  # save the plot
  ggsave(
    paste0("../results",  "/ggpairs_plot.png"), 
    pairs
  )
}

main(opt[["--input"]], opt[["--out_dir"]])
