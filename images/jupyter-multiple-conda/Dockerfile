# Python 3.11
FROM quay.io/jupyter/base-notebook:2024-02-13
# this has CONDA_DIR defined

# Add git
USER root
RUN apt-get -y update
RUN apt-get -y install git
USER ${NB_USER}

# Add the packages needed for jupyterhub
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f jhub-environment.yml && conda clean --all
RUN rm jhub-environment.yml

# Create environment 1
COPY env1.yml env1.yml
RUN conda env create --name env1 --file env1.yml
RUN rm env1.yml

# Create environment 2
COPY env2.yml env2.yml
RUN conda env create --name env2 --file env2.yml
RUN rm env2.yml

# Register the kernels so you can open in notebooks
USER root
RUN python -m ipykernel install --prefix ${CONDA_DIR}/envs/env1 --name env1 --display-name env1
RUN python -m ipykernel install --prefix ${CONDA_DIR}/envs/env2 --name env2 --display-name env2

# This will prevent conda envs from being registered so that there are not multiple buttons
COPY jupyter_notebook_config.py jupyter_notebook_config.py
RUN mkdir -p /etc/jupyter \
    && cp jupyter_notebook_config.py /etc/jupyter

USER ${NB_USER}
