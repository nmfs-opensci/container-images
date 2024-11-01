FROM ghcr.io/nmfs-opensci/py-rocket-2:f5ee1fd5e5bb
LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/draft_images/py-rocket-2
LABEL org.opencontainers.image.description="Geospatial Python (3.11) and R (4.4) image"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2024.11.01

USER root

# install the geospatial libraries and R spatial; the rocket script are part of py-rocket-base
RUN /rocker_scripts/install_geospatial.sh

# Install extra cmd line packages needed for qgis
RUN apt-get update && \
    apt-get install --yes --no-install-recommends libgl1-mesa-glx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
  wget --user-agent="Mozilla/5.0" https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-5.5.4.tgz && \
  tar -zxf PanoplyJ-5.5.4.tgz && \
  rm -rf PanoplyJ-5.5.4.tgz
ENV PATH=${PATH}:/tmp/PanoplyJ

USER ${NB_USER}
WORKDIR ${HOME}


