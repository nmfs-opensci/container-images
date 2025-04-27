FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.17

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/py-rocket-2
LABEL org.opencontainers.image.description="Geospatial Python (3.12)"
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.04.27

ENV PROJ_LIB=/srv/conda/envs/notebook/share/proj

USER root

COPY . /tmp2/
RUN /pyrocket_scripts/install-conda-packages.sh /tmp2/environment.yml || (echo "install-conda-packages.sh failed" >&2 && exit 1)
RUN rm -rf /tmp2

# Install tools for working with Google Cloud Buckets
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-cli -y

USER ${NB_USER}
WORKDIR ${HOME}
