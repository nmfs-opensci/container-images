# devcontainer-focused Rocker
FROM ghcr.io/rocker-org/devcontainer/tidyverse:4.3

# some Git preferences
RUN git config --system pull.rebase false && \
    git config --system credential.helper 'cache --timeout=36000'

# Set up conda
ENV NB_USER=jovyan
ENV CONDA_ENV=/opt/miniforge3
ENV PATH=${CONDA_ENV}/bin:${PATH}
RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" && \
    bash Miniforge3-$(uname)-$(uname -m).sh -b -p ${CONDA_ENV} && \
    chown ${NB_USER}:staff -R ${CONDA_ENV} && \
    rm Miniforge3*.sh *.deb

RUN echo "PATH=${PATH}" >>"${R_HOME}/etc/Renviron.site"

# Initialize conda by default for all users:
RUN conda init --system

# Standard user setup here
USER ${NB_USER} 
WORKDIR /home/${NB_USER}
RUN usermod -s /bin/bash ${NB_USER} 

# install into the default environment
COPY install.R install.R
RUN Rscript install.R && rm install.R

# set-up the base coastwatch environment
# make sure we install in the base environment
COPY coastwatch-environment.yml coastwatch-environment.yml
RUN conda env update --name base -f coastwatch-environment.yml && conda clean --all

# add the packages needed for jupyterhubs
# need the --name part so that this is put in the coastwatch env
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f jhub-environment.yml && conda clean --all

