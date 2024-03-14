# Python 3.11
FROM quay.io/jupyter/base-notebook:2024-02-13

USER root
RUN apt-get -y update
RUN apt-get -y install git
USER ${NB_USER}

# Add the packages you want to environment.yml
# Adds to the base env so you do not need to activate
COPY environment.yml environment.yml
RUN conda env update --name base -f environment.yml && conda clean --all

