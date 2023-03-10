
library(tidyverse)

data_summary_fun <- function(file_path_url) {
    data <- read_delim(file_path_url, ";")
    new_names <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "pH", "sulphates", "alcohol", "quality")
    data <- rename(data, !!!setNames(names(data), new_names))
    data_median <- median(data$alcohol)
    data_sd<-sd(data$alcohol)
    data_new <- tibble(data_median,data_sd)
    data_new <- rename(data_new, !!!setNames(names(data_new), c("median","standard_deviation")))
    return(data_new)
    
}


