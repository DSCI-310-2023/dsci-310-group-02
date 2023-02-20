FROM jupyter/r-notebook

RUN Rscript -e "install.packages('remotes', repos='http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('cowsay','0.8.0')"
RUN Rscript -e "remotes::install_version('tidyverse', version = '1.3.2', repos = 'https://cloud.r-project.org')"
