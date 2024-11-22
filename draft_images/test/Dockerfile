FROM ghcr.io/nmfs-opensci/py-rocket-base:latest

RUN echo ${PATH}

USER root

RUN cd /tmp && \
  wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | bash

COPY . /tmp2/
RUN /pyrocket_scripts/install-apt-packages.sh /tmp2/apt.txt || echo "install-apt-packages.sh failed" || true
RUN rm -rf /tmp2

USER ${NB_USER}
WORKDIR ${HOME}
