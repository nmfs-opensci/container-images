# Rocker verse with conda notebook environment; 
# rstudio user with /home/jovyan home dir
FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:4.4-3.10

USER root

# install the geospatial libraries and R spatial
# RUN /rocker_scripts/install_geospatial.sh
# Wee need the dev version of gdal
RUN apt-get update && apt-get -y install libxt6 libzmq3-dev gh
ADD https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/experimental/install_dev_osgeo.sh install_dev_osgeo.sh
RUN bash install_dev_osgeo.sh && rm install_dev_osgeo.sh

USER ${NB_USER} 

# install a few more R geospatial libraries mainly for CoastWatch
COPY install.R install.R
RUN Rscript install.R && rm install.R

# install the Python geospatial libraries
COPY environment.yml environment.yml
RUN conda env update -n notebook -f environment.yml \
    && conda clean --all \
    && rm environment.yml

# Set user dir
WORKDIR /home/jovyan
