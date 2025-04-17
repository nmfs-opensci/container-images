FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.16

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=ghcr.io/nmfs-opensci/py-rocket-base
LABEL org.opencontainers.image.description="asar"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.04.16

USER root
COPY . /tmp2/
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || echo "install-r-package.sh failed" || true
RUN rm -rf /tmp2

ENV JUPYTERHUB_DEFAULT_URL=/rstudio

USER ${NB_USER}
WORKDIR ${HOME}
