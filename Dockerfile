FROM rocker/rstudio:4.1.3

RUN apt-get update && \
    apt-get install -y libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages('remotes', repos='http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('tidyverse', version = '1.3.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "install.packages('kknn', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN Rscript -e "install.packages('testthat')"
RUN Rscript -e "remotes::install_version('knitr','1.38')"
