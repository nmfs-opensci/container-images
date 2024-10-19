FROM ghcr.io/nmfs-opensci/py-rocket-base:8aeeeb44030c

USER ${NB_USER}
WORKDIR ${HOME}

# install into the coastwatch packages if missing environment
COPY install.R install.R
RUN Rscript install.R && rm install.R

COPY environment.yml environment.yml
RUN mamba env update --name notebook -f environment.yml && mamba clean --all
RUN rm environment.yml

USER root

# Install extra cmd line packages needed for qgis
RUN apt-get update && \
    apt-get install --yes --no-install-recommends libgl1-mesa-glx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install cwutils
USER root
RUN cd /tmp && \
    wget https://www.star.nesdis.noaa.gov/socd/coastwatch/cwf/cwutils-4_0_0_198-linux-x86_64.tar.gz && \
    tar -zxf cwutils-4_0_0_198-linux-x86_64.tar.gz && \
    rm -rf cwutils-4_0_0_198-linux-x86_64.tar.gz
ENV PATH=${PATH}:/tmp/cwutils_4.0.0.198/bin
ENV MANPATH=${MANPATH}:/tmp/cwutils_4.0.0.198/doc/man
ENV INSTALL4J ADD VM PARAMS=-Dsun.java2d.uiScale=2.0
COPY cdat_desktop.png ${REPO_DIR}/cdat_desktop.png

# Add a Desktop application
RUN mkdir -p ${REPO_DIR}/mime/
COPY *.desktop ${REPO_DIR}/
COPY mime/*.xml ${REPO_DIR}/mime/

USER ${NB_USER}