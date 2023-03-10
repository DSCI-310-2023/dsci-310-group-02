read_csv_file <- function(file_path) {
  data <- read.csv(file_path, header = TRUE)
  return(data)
}
