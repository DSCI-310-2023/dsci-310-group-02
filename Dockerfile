FROM jupyter/r-notebook:r-4.1.2

COPY white_analysis.ipynb .


RUN Rscript -e "install.packages('remotes', repos='http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('tidyverse', version = '1.3.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "install.packages('kknn', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN Rscript -e "install.packages('testthat')"

CMD ["jupyter", "lab", "white_analysis.ipynb"]