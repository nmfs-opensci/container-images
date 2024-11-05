FROM ghcr.io/nmfs-opensci/py-rocket-2:c0a42fb2bcc2

RUN echo ${PATH}

USER root
RUN echo ${PATH}
RUN /pyrocket_scripts/install-conda-packages.sh || echo "install-conda-packages.sh failed" || true
RUN /pyrocket_scripts/install-r-package.sh || echo "install-r-package.sh failed" || true
RUN /pyrocket_scripts/install-pip-packages.sh || echo "install-pip-packages.sh failed" || true
RUN /pyrocket_scripts/install-apt-packages.sh || echo "install-apt-packages.sh failed" || true
RUN /pyrocket_scripts/run-postbuild.sh || echo "run-postbuild.sh failed" || true
RUN /pyrocket_scripts/setup-start.sh || echo "setup-start.sh failed" || true
RUN /pyrocket_scripts/setup-desktop.sh || echo "setup-desktop.sh failed" || true
USER ${NB_USER}

