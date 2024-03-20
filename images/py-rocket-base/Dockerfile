# devcontainer-focused Rocker
FROM ghcr.io/rocker-org/devcontainer/tidyverse:4.3
# switch user to jovyan; later not working
#RUN usermod -l rstudio jovyan

# some Git preferences
RUN git config --system pull.rebase false && \
    git config --system credential.helper 'cache --timeout=36000'
    
# codeserver
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Set up conda
ENV NB_USER=rstudio
ENV CONDA_ENV=/opt/miniforge3
ENV PATH=${CONDA_ENV}/bin:${PATH}
RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" && \
    bash Miniforge3-$(uname)-$(uname -m).sh -b -p ${CONDA_ENV} && \
    chown ${NB_USER}:staff -R ${CONDA_ENV} && \
    rm -f Miniforge3*.sh *.deb

RUN echo "PATH=${PATH}" >>"${R_HOME}/etc/Renviron.site"

# Initialize conda by default for all users:
RUN conda init --system

# Standard user setup here
RUN usermod -d /home/jovyan rstudio
USER ${NB_USER} 
WORKDIR /home/jovyan
# Make bash default
RUN usermod -s /bin/bash ${NB_USER} 

# add the packages needed for jupyterhubs
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f jhub-environment.yml && conda clean --all
RUN rm jhub-environment.yml
