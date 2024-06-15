# Rocker verse with conda notebook environment; 
# rstudio user with /home/jovyan home dir
FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:4.4-3.10
LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/r-geospatial-sdm
LABEL org.opencontainers.image.description="Geospatial R (vrs 4.4) image with Species Dist Modeling packages including sdmTMB"
LABEL org.opencontainers.image.licenses=Apache2.0

USER root

# install the geospatial libraries and R spatial
RUN /rocker_scripts/install_geospatial.sh

USER ${NB_USER} 

# install a few more R geospatial, sdm and sdmTMB libraries
COPY install.R install.R
RUN Rscript install.R && rm install.R

# Set user dir
WORKDIR /home/jovyan
