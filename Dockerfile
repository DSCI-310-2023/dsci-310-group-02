FROM rocker/tidyverse:4.1.3

RUN apt-get update && \
    apt-get install -y libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages('remotes', repos='https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('kknn', version = '1.3.1', repos= 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('testthat', version = '3.1.6', repos= 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('knitr','1.38')"
