# Rocker verse with conda notebook environment; 
# rstudio user with /home/jovyan home dir
FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:4.3.3-3.10

USER root

# install the geospatial libraries and R spatial
RUN /rocker_scripts/install_geospatial.sh

USER ${NB_USER} 

# install a few more R geospatial libraries
COPY install.R install.R
RUN Rscript install.R && rm install.R

# install the Python geospatial libraries
COPY environment.yml environment.yml
RUN conda env update -n notebook -f environment.yml \
    && conda clean --all \
    && rm environment.yml

# Set user dir
WORKDIR /home/jovyan
