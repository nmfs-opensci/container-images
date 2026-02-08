FROM ghcr.io/nmfs-opensci/py-rocket-base:2026.02.07

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/py-rocket-geospatial-2
LABEL org.opencontainers.image.description="Geospatial Python (3.11) and R (4.5.1) image with Desktop (QGIS, Panoply, CWUtils)"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2026.02.07

ENV PROJ_LIB=/srv/conda/envs/notebook/share/proj

USER root
# Install Zotero; must be run before apt since apt install zotero requires this script be run first
RUN wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | bash

COPY . /tmp/
# Update conda env sequentially to prevent hairy solve
RUN /pyrocket_scripts/install-conda-packages.sh /tmp/env-core1.yml || (echo "install env-core1 failed" && exit 1)
RUN /pyrocket_scripts/install-conda-packages.sh /tmp/env-core2.yml || (echo "install env-core2 failed" && exit 1)
RUN /pyrocket_scripts/install-conda-packages.sh /tmp/env-geo.yml || (echo "install env-geo failed" && exit 1)
RUN /pyrocket_scripts/install-conda-packages.sh /tmp/env-viz.yml || (echo "install env-viz failed" && exit 1)
RUN /pyrocket_scripts/install-conda-packages.sh /tmp/env-qgis.yml || (echo "install env-qgis failed" && exit 1)
RUN /pyrocket_scripts/install-apt-packages.sh /tmp/apt.txt || (echo "install-apt-packages.sh failed" && exit 1)
RUN /pyrocket_scripts/install-desktop.sh /tmp/Desktop|| (echo "setup-desktop.sh failed" && exit 1)

USER root
# install the geospatial libraries and R spatial; the rocket script are part of py-rocket-base
# need to ensure that it installs to the site-library (that user can control) and with a clean PATH
# Ensure packages go to site-library whether installed via R, Rscript, or littler (r)
RUN echo '.libPaths("/usr/local/lib/R/site-library")' > /etc/littler.r && \
    echo '.libPaths("/usr/local/lib/R/site-library")' > /tmp/rprofile.site && \
    R_PROFILE=/tmp/rprofile.site \
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    /rocker_scripts/install_geospatial.sh && \
    rm /etc/littler.r /tmp/rprofile.site

# Any packages that have gdal dependency should be install after install_geospatial.sh is run
COPY . /tmp/
RUN /pyrocket_scripts/install-r-packages.sh /tmp/install.R || (echo "install-r-package.sh failed" && exit 1)

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
  wget --user-agent="Mozilla/5.0" https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-5.9.0.tgz && \
  tar -zxf PanoplyJ-5.9.0.tgz && \
  rm -rf PanoplyJ-5.9.0.tgz
ENV PATH=${PATH}:/tmp/PanoplyJ

# Install tools for working with Google Cloud Buckets
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-cli -y

# Clear out files put in /tmp
RUN rm -rf /tmp/*

USER ${NB_USER}
WORKDIR ${HOME}
