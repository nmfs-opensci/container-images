FROM ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial:4.4-3.10
LABEL org.opencontainers.image.maintainers="sun.bak-hospital@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/coastwatch
LABEL org.opencontainers.image.description="CoastWatch image for satellite training courses"
LABEL org.opencontainers.image.licenses=Apache2.0

# Make sure R uses the conda path
USER root
RUN echo "PATH=${PATH}" >>"${R_HOME}/etc/Renviron.site"

USER ${NB_USER}
WORKDIR ${HOME}

# install into the coastwatch packages if missing environment
COPY install.R install.R
RUN Rscript install.R && rm install.R

# set-up the base coastwatch environment
# make sure we install in the notebook environment which is default in the
# Openscapes image
COPY coastwatch-environment.yml coastwatch-environment.yml
RUN mamba env update --name notebook -f coastwatch-environment.yml && mamba clean --all
RUN rm coastwatch-environment.yml

# Install cwutils
USER root
RUN cd /tmp && \
    wget https://www.star.nesdis.noaa.gov/socd/coastwatch/cwf/cwutils-4_0_0_198-linux-x86_64.tar.gz && \
    tar -zxf cwutils-4_0_0_198-linux-x86_64.tar.gz && \
    rm -rf cwutils-4_0_0_198-linux-x86_64.tar.gz

ENV PATH=${PATH}:/tmp/cwutils-4.0.0.198/bin
ENV MANPATH=${MANPATH}:/tmp/cwutils_4.0.0.198/doc/man
ENV INSTALL4J ADD VM PARAMS=-Dsun.java2d.uiScale=2.0
USER ${NB_USER}

