# Rocker verse with conda notebook environment; rstudio user with
# /home/jovyan home dir
FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:4.3.3-3.10

# install the geospatial libraries and R spatial
RUN /rocker_scripts/install_geospatial.sh

# install a few more R geospatial libraries
COPY install.R install.R
RUN Rscript install.R && rm install.R

# install the Python geospatial libraries
COPY environment.yml environment.yml
RUN conda env update -n notebook -f environment.yml && conda clean --all

# Standard user setup here
USER ${NB_USER} 
WORKDIR /home/${NB_USER}
