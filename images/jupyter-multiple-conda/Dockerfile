# Python 3.11
FROM quay.io/jupyter/base-notebook:2024-02-13

# Add git
USER root
RUN apt-get -y update
RUN apt-get -y install git
USER ${NB_USER}

# Add the packages needed for jupyterhub
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f environment.yml && conda clean --all
RUN rm jhub-environment.yml

# Create environment 1
COPY env1.yml env1.yml
RUN conda create --name env1 --file env1.yml
RUN rm env1.yml
RUN python -m ipykernel install --prefix /srv/conda/envs/env1 --name env1 --display-name env1

# Create environment 2
COPY env2.yml env2.yml
RUN conda create --name env2 --file env2.yml
RUN rm env2.yml
RUN python -m ipykernel install --prefix /srv/conda/envs/env2 --name env2 --display-name env2


