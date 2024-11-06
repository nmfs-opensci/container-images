FROM ghcr.io/nmfs-opensci/py-rocket-2:732c273a2ba2

RUN echo ${PATH}

USER root
COPY . /tmp2/
RUN /pyrocket_scripts/install-conda-packages.sh /tmp2/environment.yml || echo "install-conda-packages.sh failed" || true
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || echo "install-r-package.sh failed" || true
RUN /pyrocket_scripts/install-pip-packages.sh /tmp2/requirements.txt || echo "install-pip-packages.sh failed" || true
RUN /pyrocket_scripts/install-apt-packages.sh /tmp2/apt.txt || echo "install-apt-packages.sh failed" || true
RUN /pyrocket_scripts/install-desktop.sh /tmp2/Desktop|| echo "setup-desktop.sh failed" || true
RUN /pyrocket_scripts/run-postbuild.sh /tmp2/postBuild|| echo "run-postbuild.sh failed" || true
RUN /pyrocket_scripts/setup-start.sh /tmp2/start || echo "setup-start.sh failed" || true
RUN rm -rf /tmp2
USER ${NB_USER}

COPY apt.txt apt.txt
RUN rm apt.txt || true

USER root
# install the geospatial libraries and R spatial; the rocket script are part of py-rocket-base
RUN PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin && \
    /rocker_scripts/install_geospatial.sh

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
  wget --user-agent="Mozilla/5.0" https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-5.5.4.tgz && \
  tar -zxf PanoplyJ-5.5.4.tgz && \
  rm -rf PanoplyJ-5.5.4.tgz
ENV PATH=${PATH}:/tmp/PanoplyJ

USER ${NB_USER}
WORKDIR ${HOME}
