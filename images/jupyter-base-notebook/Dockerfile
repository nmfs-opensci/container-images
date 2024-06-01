# Python 3.11
FROM quay.io/jupyter/base-notebook:2024-02-13
LABEL org.opencontainers.image.maintainers="Jupyter Docker Stacks"
LABEL org.opencontainers.image.authors="Jupyter Docker Stacks"
LABEL org.opencontainers.image.source="https://jupyter-docker-stacks.readthedocs.io/en/latest/"
LABEL org.opencontainers.image.description="An image mostly for testing"
LABEL org.opencontainers.image.licenses=Modified BSD License

USER root
RUN apt-get -y update
RUN apt-get -y install git
USER ${NB_USER}

# Add the packages you want to environment.yml
# Adds to the base env so you do not need to activate
COPY environment.yml environment.yml
RUN conda env update --name base -f environment.yml && conda clean --all

