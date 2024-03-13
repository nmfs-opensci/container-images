# devcontainer-focused Rocker
FROM docker.io/aomlomics/tourmaline:latest

ENV NB_USER=jovyan
USER ${NB_USER} 
WORKDIR /home/${NB_USER}
RUN usermod -s /bin/bash ${NB_USER} 

# add the packages needed for jupyterhubs
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f jhub-environment.yml && conda clean --all

