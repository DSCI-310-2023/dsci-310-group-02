FROM jupyter/scipy-notebook:8f0a73e76d17

RUN conda install --yes -c conda-forge\
    pandas=1.4.1 \
    matplotlib=3.5.1 \
    numpy=1.22.2 \

