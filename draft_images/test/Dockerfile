FROM ghcr.io/nmfs-opensci/py-rocket-2:24af2c9990cc

RUN echo ${PATH}

USER root
RUN echo ${PATH}
RUN /pyrocket_scripts/scripts/install-conda-packages.sh
USER ${NB_USER}

