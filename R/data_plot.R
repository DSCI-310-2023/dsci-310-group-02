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
options(repr.plot.width = 12, repr.plot.height = 8)
grp_df <- c_data_df %>% group_by(quality)

categorical_distribution <- grp_df %>% 
  ggplot(mapping = (aes(x = quality, fill = quality))) +
  geom_bar() +
  labs(x = "Category", y = "Number of Occurances", fill = "Category") +
  ggtitle("Histogram of Each Category Count")
  
# save the plot ----------------------------------------------------------------
ggsave(
  paste0(opt$out_dir, "/count_plot.png"), 
  categorical_distribution
)

# create a ggpairs plot --------------------------------------------------------
# matrix of plots
pairs <- ggpairs(c_data_df, upper = list(continuous = wrap("cor", size = 3)))
# adjust the titles' size and angle
pairs <- pairs + theme(text = element_text(size=8),
                       axis.text.x = element_text(angle=90, hjust=1))
# correlation matrix plot
cor_pair <- ggcorr(c_data_df, label = TRUE, label_round = 2)
# get the color from the correlation matrix plot
cor_g <- ggplotGrob(cor_pair)
colors <- cor_g$grobs[[6]]$children[[3]]$gp$fill
# change the background color of matrix of plots
idx <- 1
c <- ncol(c_data_df)
for (k1 in 1:(c-1)) {
  for (k2 in (k1+1):(c-1)) {
    plt <- getPlot(pairs,k1,k2) +
      theme(panel.background = element_rect(fill = colors[idx], color="white"),
            panel.grid.major = element_line(color= colors[idx]))
    pairs <- putPlot(pairs,plt,k1,k2)
    idx <- idx+1
}
}

# save the plot
ggsave(
  paste0(opt$out_dir,  "/ggpairs_plot.png"), 
  pairs,
  width = 10, height = 10, dpi = 300
)
