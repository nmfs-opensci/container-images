FROM openscapes/python:39dffde
LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="luiz.lopez@nasa.gov"
LABEL org.opencontainers.image.source=https://github.com/NASA-Openscapes/corn/tree/main/ci
LABEL org.opencontainers.image.description="NASA Openscapes Python image used in workshops"
LABEL org.opencontainers.image.licenses=Apache2.0

# install nb_conda_kernels to allow conda kernels

USER ${NB_USER}

RUN mamba install -c conda-forge -n notebook cmocean
