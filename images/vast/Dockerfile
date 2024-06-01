# verse rocker with R 4.3 that is tailored to spin up in Codespaces nicely
FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:4.3.3-3.10
LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/vast
LABEL org.opencontainers.image.description="VAST with R 4.3.3"
LABEL org.opencontainers.image.licenses=Apache2.0


USER root

# install the geospatial libraries and R spatial
RUN /rocker_scripts/install_geospatial.sh

USER ${NB_USER} 

# VAST dependencies packages
RUN R -e 'install.packages("INLA",repos=c(getOption("repos"), INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)'
RUN R -e 'install.packages("TMB")'
RUN R -e 'devtools::install_github("james-thorson/FishStatsUtils@main", INSTALL_opts="--no-staged-install")'
RUN R -e 'devtools::install_github("james-thorson/VAST@main", INSTALL_opts="--no-staged-install")'
