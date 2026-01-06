FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.12.22

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.authors=""
LABEL org.opencontainers.image.source="https://github.com/nmfs-opensci/container-images/acoustics"
LABEL org.opencontainers.image.description="image for acoustics workshops."
LABEL org.opencontainers.image.licenses=Apache2.0

USER root

COPY . /tmp2/
RUN /pyrocket_scripts/install-conda-packages.sh /tmp2/environment.yml || echo "install-conda-packages.sh failed" || true
RUN rm -rf /tmp2

RUN git clone https://github.com/gavinmacaulay/data_store_testing.git && \
    cd data_store_testing && \
    wget https://echosms-datastore.syd1.cdn.digitaloceanspaces.com/echosms_datastore_final.zip && \
    unzip echosms_datastore_final.zip -d echosms_datastore_final && \
    rm echosms_datastore_final.zip

USER ${NB_USER}
WORKDIR ${HOME}
