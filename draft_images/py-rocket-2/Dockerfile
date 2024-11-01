FROM ghcr.io/nmfs-opensci/py-rocket-2:f5ee1fd5e5bb

USER root

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


