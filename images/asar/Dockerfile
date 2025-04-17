FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.16

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=ghcr.io/nmfs-opensci/py-rocket-base
LABEL org.opencontainers.image.description="asar"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.04.16

USER root
COPY . /tmp2/
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || echo "install-r-package.sh failed" || true
RUN rm -rf /tmp2

# Add custom Jupyter server configurations to launch in RStudio
COPY jupyter-rstudio-config.json jupyter-rstudio-config.json
RUN cp jupyter-rstudio-config.json ${NB_PYTHON_PREFIX}/etc/jupyter/jupyter_server_config.d/ && \
    cp jupyter-rstudio-config.json ${NB_PYTHON_PREFIX}/etc/jupyter/jupyter_notebook_config.d/ && \
    rm jupyter-rstudio-config.json



USER ${NB_USER}
WORKDIR ${HOME}
