FROM ghcr.io/nmfs-opensci/py-rocket-2:c95e447c9eb5

RUN echo ${PATH}

USER root
RUN echo ${PATH}
RUN /pyrocket_scripts/install-conda-packages.sh
USER ${NB_USER}

