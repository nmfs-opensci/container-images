FROM ghcr.io/nmfs-opensci/py-rocket-2:54fe630f8393

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

COPY user-dirs.defaults user-dirs.defaults
RUN cp user-dirs.defaults /etc/xdg/user-dirs.defaults && rm user-dirs.defaults

COPY Desktop/cdat.desktop cdat.desktop
RUN mkdir -p /usr/share/Desktop && cp cdat.desktop /usr/share/Desktop/cdat.desktop && rm cdat.desktop

USER ${NB_USER}
WORKDIR ${HOME}


