FROM ghcr.io/nmfs-opensci/container-images/py-geospatial:2025.04.26

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images
LABEL org.opencontainers.image.description="Geospatial Python (3.12) and R (4.4.3) image"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.04.26

USER root

COPY . /tmp2/
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || (echo "install-r-package.sh failed" >&2 && exit 1)
RUN rm -rf /tmp2
RUN /pyrocket_scripts/install-geospatial-r.sh || (echo "install-geospatial-r.sh failed" >&2 && exit 1)

USER ${NB_USER}
WORKDIR ${HOME}
