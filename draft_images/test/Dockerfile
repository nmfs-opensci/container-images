FROM ghcr.io/nmfs-opensci/py-rocket-base:fdced76

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/py-rocket-2
LABEL org.opencontainers.image.description="Geospatial Python (3.12) and R (4.4.3) image with Desktop (QGIS, Panoply, CWUtils)"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2026.02.07

ENV PROJ_LIB=/srv/conda/envs/notebook/share/proj

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
RUN /pyrocket_scripts/install-r-packages.sh /tmp/install.R || echo "install-r-package.sh failed" || true
RUN rm -rf /tmp
  
USER ${NB_USER}
WORKDIR ${HOME}
