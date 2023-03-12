#' Plotting the data
#'
#' Creates a bar chart for the count of wine quality,
#' and also a ggpairs plot for the correlation between
#' all predictors. 
#' Saves the plot as a png.
#'
#' @param file_path The cleaned data in csv file
#' 
#' @return A bar chart and a ggpairs plot
#' 
#' @export count_plot.png&ggpairs_plot.png
#' 
#' @examples
#' count_plot("../data/cleaned_data.csv")
#' ggpairs_plot("../data/cleaned_data.csv")

library(dplyr)
library(ggplot2)
library(GGally)

# create a bar chart for the count of wine quality
count_plot <- function(file_path){
  # load data
  c_data <- read_csv(file_path)
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
  # show the plot
  quality_distribution
}

# create a ggpairs plot
ggpairs_plot <- function(file_path){
  # load data
  c_data <- read_csv(file_path)
  c_data_df <- as.data.frame(c_data)

  options(repr.plot.width = 12, repr.plot.height = 8)
  pairs <- ggpairs(c_data_df)
  
  # save the plot
  ggsave(
    paste0("../results",  "/ggpairs_plot.png"), 
    pairs
  )
  # show the plot
  pairs
}
