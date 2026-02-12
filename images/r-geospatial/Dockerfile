FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.26

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/r-geospatial-sdm
LABEL org.opencontainers.image.description="Geospatial R (vrs 4.4) image"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.04.23

USER root

RUN echo '.libPaths("/usr/local/lib/R/site-library")' > /etc/littler.r && \
    echo '.libPaths("/usr/local/lib/R/site-library")' > /tmp/rprofile.site && \
    R_PROFILE=/tmp/rprofile.site \
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    /rocker_scripts/install_geospatial.sh && \
    rm /etc/littler.r /tmp/rprofile.site

# install a few more R geospatial libraries
COPY . /tmp2/
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || echo "install-r-package.sh failed" || true
RUN rm -rf /tmp2

USER ${NB_USER} 

# Set user dir
WORKDIR /home/jovyan
