# geospatial rocker with R 4.3 that is tailored to spin up in Codespaces nicely
FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

# By default, the versioned rocker image (which py-rocket-base uses) will use 
# the Posit repository which has binaries for Unbuntu (which rocker image uses)

# VAST dependencies packages
RUN R -e 'install.packages("INLA",repos=c(getOption("repos"), INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)'
RUN R -e 'install.packages("TMB")'
RUN R -e 'devtools::install_github("james-thorson/FishStatsUtils@main", INSTALL_opts="--no-staged-install")'
RUN R -e 'devtools::install_github("james-thorson/VAST@main", INSTALL_opts="--no-staged-install")'
