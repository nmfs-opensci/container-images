FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.11

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/py-rocket-2
LABEL org.opencontainers.image.description="Geospatial Python (3.11) and R (4.4.3) image with Desktop (QGIS, Panoply, CWUtils)"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.04.11

ENV PROJ_LIB=/srv/conda/envs/notebook/share/proj

USER root
# Install Zotero; must be run before apt since apt install zotero requires this script be run first
RUN wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | bash

COPY . /tmp2/
RUN /pyrocket_scripts/install-conda-packages.sh /tmp2/environment.yml || echo "install-conda-packages.sh failed" || true
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || echo "install-r-package.sh failed" || true
RUN /pyrocket_scripts/install-apt-packages.sh /tmp2/apt.txt || echo "install-apt-packages.sh failed" || true
RUN /pyrocket_scripts/install-desktop.sh /tmp2/Desktop|| echo "setup-desktop.sh failed" || true
RUN rm -rf /tmp2
USER ${NB_USER}

USER root
# install the geospatial libraries and R spatial; the rocket script are part of py-rocket-base
RUN PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin && \
    /rocker_scripts/install_geospatial.sh

# Install cwutils
RUN cd /tmp && \
    wget https://www.star.nesdis.noaa.gov/socd/coastwatch/cwf/cwutils-4_0_0_198-linux-x86_64.tar.gz && \
    tar -zxf cwutils-4_0_0_198-linux-x86_64.tar.gz && \
    rm -rf cwutils-4_0_0_198-linux-x86_64.tar.gz
ENV PATH=${PATH}:/tmp/cwutils_4.0.0.198/bin
ENV MANPATH=${MANPATH}:/tmp/cwutils_4.0.0.198/doc/man
ENV INSTALL4J ADD VM PARAMS=-Dsun.java2d.uiScale=2.0

# Install panoply
RUN cd /tmp && \
  wget --user-agent="Mozilla/5.0" https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-5.6.0.tgz && \
  tar -zxf PanoplyJ-5.6.0.tgz && \
  rm -rf PanoplyJ-5.6.0.tgz
ENV PATH=${PATH}:/tmp/PanoplyJ

# Install tools for working with Google Cloud Buckets
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-cli -y

USER ${NB_USER}
WORKDIR ${HOME}
