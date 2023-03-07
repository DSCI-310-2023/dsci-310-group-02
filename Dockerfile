FROM jupyter/datascience-notebook

COPY white_analysis.ipynb .


RUN jupyter lab white_analysis.ipynb
RUN Rscript -e "install.packages('remotes', repos='http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('tidyverse', version = '1.3.2', repos = 'https://cloud.r-project.org')"

