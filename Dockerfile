FROM rocker/tidyverse:4.1.3

RUN apt-get update && \
    apt-get install -y libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages('remotes', repos='https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('tidyverse','1.3.1', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('tidymodels','0.1.4', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('testthat', version = '3.1.6', repos= 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('kknn', version = '1.3.1', repos= 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('repr', version = '1.1.4', repos= 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('ggplot2', version = '3.3.6', repos= 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('knitr','1.38', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('devtools','2.4.5', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('bookdown','0.33', repos = 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('docopt', version = '0.7.1', repos= 'https://cran.r-project.org')"
RUN Rscript -e "remotes::install_version('tinytex', version = '0.44', repos= 'https://cran.r-project.org')"
