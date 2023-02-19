FROM jupyter/datascience-notebook


RUN conda install --yes -c conda-forge r-tidyverse=1.3.1 
RUN conda install --yes -c conda-forge r-tidymodels=0.1.4
