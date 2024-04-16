FROM ghcr.io/nmfs-opensci/container-images/nmfs-opensci-python-base:latest
LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/cmip6-cookbook
LABEL org.opencontainers.image.description="CMIP6 tutorials image"
LABEL org.opencontainers.image.licenses=Apache2.0

# set-up the base cmip6-cookbook environment and create a kernel
ENV NEWENV=cmip6

COPY environment.yml environment.yml
RUN mamba env create -n ${NEWENV} -f environment.yml
RUN rm environment.yml
RUN python -m ipykernel install --prefix ${CONDA_DIR}/envs/notebook --name ${NEWENV}

USER ${NB_USER}

