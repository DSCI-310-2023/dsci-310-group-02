FROM jupyter/r-notebook:r-4.1.2

COPY white_analysis.ipynb .


RUN Rscript -e "install.packages('devtools', repos='http://cran.us.r-project.org')"
RUN Rscript -e "devtools::install_version('testthat', version = '3.1.2', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('remotes', repos='http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('tidyverse', version = '1.3.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "install.packages('IRkernel')" 
RUN Rscript -e "IRkernel::installspec()"


CMD ["jupyter", "lab", "white_analysis.ipynb"]
