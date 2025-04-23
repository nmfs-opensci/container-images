# A pangeo base Python 3.10 + geospatial image
FROM FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.17
LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.authors="Wu-Jung Lee + echopype team"
LABEL org.opencontainers.image.source="https://github.com/nmfs-opensci/container-images/echopype"
LABEL org.opencontainers.image.description="echopype tooling for ocean sonar data processing in Python. Author: Wu-Jung Lee + echopype team."
LABEL org.opencontainers.image.licenses=Apache2.0

# The default conda env on the openscapes image is notebook
# Pin echopype so the examples run
RUN mamba install -c conda-forge --name notebook cmocean
RUN mamba install -c conda-forge --name notebook echopype=0.10.1
