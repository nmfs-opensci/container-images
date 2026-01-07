FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.26

LABEL org.opencontainers.image.maintainers="emiliom@uw.edu"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov, emiliom@uw.edu"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/py-rocket-2
LABEL org.opencontainers.image.description="OceanHackWeek-en-Espan-ol Geospatial Python (3.12) and R (4.4.3) image with Desktop (QGIS, Panoply)"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.11.13

ENV PROJ_LIB=/srv/conda/envs/notebook/share/proj

USER root

# install-conda changes to jovyan as user. If there are any pip installs in the env.yaml, mamba needs write access. /tmp is writeable
COPY . /tmp/
RUN /pyrocket_scripts/install-conda-packages.sh /tmp2/environment.yml || echo "install-conda-packages.sh failed" || true
RUN /pyrocket_scripts/install-apt-packages.sh /tmp2/apt.txt || echo "install-apt-packages.sh failed" || true
RUN /pyrocket_scripts/install-desktop.sh /tmp2/Desktop|| echo "setup-desktop.sh failed" || true
RUN rm -rf /tmp/*

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


COPY . /tmp2/
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || echo "install-r-package.sh failed" || true
RUN rm -rf /tmp2


# Install panoply
# 11/6/2025 16:00 PST
# 0.336 Connecting to www.giss.nasa.gov (www.giss.nasa.gov)|129.164.141.233|:443... failed: Connection refused.
# 0.428 Connecting to www.giss.nasa.gov (www.giss.nasa.gov)|2001:4d0:2310:151::233|:443... failed: Network is unreachable.
# 11/8/2025: Uploaded latest Panoply tgz to Emilio's UW website, temporarily, as a stopgap
ENV PANOPLY_VERSION=5.7.1
RUN cd /tmp && \
  # wget --user-agent="Mozilla/5.0" https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-${PANOPLY_VERSION}.tgz && \
  wget --user-agent="Mozilla/5.0" http://staff.washington.edu/emiliom/out/PanoplyJ-${PANOPLY_VERSION}.tgz && \
  tar -zxf PanoplyJ-${PANOPLY_VERSION}.tgz && \
  rm -rf PanoplyJ-${PANOPLY_VERSION}.tgz
ENV PATH=${PATH}:/tmp/PanoplyJ

# Install tools for working with Google Cloud Buckets
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-cli -y

USER ${NB_USER}
WORKDIR ${HOME}
