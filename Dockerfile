FROM rocker/rstudio:4.1.3

RUN apt update -y

RUN Rscript -e "install.packages('remotes', repos='http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('tidyverse', version = '1.3.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "install.packages('kknn', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN Rscript -e "install.packages('testthat')"

