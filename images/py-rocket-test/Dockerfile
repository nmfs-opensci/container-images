FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.26

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/py-rocket-test
LABEL org.opencontainers.image.description="Geospatial Python (3.12) and R (4.4.3) image with Desktop (QGIS)"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.04.26

ENV PROJ_LIB=/srv/conda/envs/notebook/share/proj

USER root
# Install Zotero; must be run before apt since apt install zotero requires this script be run first
RUN wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | bash

COPY . /tmp/
RUN /pyrocket_scripts/install-conda-packages.sh /tmp2/environment.yml || echo "install-conda-packages.sh failed" || true
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || echo "install-r-package.sh failed" || true
RUN /pyrocket_scripts/install-apt-packages.sh /tmp2/apt.txt || echo "install-apt-packages.sh failed" || true
RUN /pyrocket_scripts/install-desktop.sh /tmp2/Desktop|| echo "setup-desktop.sh failed" || true
RUN rm -rf /tmp/*
RUN /pyrocket_scripts/install-geospatial-r.sh || (echo "install-geospatial-r.sh failed" >&2 && exit 1)

USER ${NB_USER}
WORKDIR ${HOME}
