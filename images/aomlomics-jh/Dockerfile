FROM docker.io/aomlomics/tourmaline:latest
LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.authors="Luke Thompson NOAA"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/aomlomics-jh
LABEL org.opencontainers.image.description="Tourmaline is an amplicon sequence processing workflow for Illumina sequence data that uses QIIME 2 and the software packages it wraps."
LABEL org.opencontainers.image.licenses=Apache2.0

ENV NB_USER=jovyan \
    NB_UID=1000 \
    CONDA_DIR=/opt/conda
ENV HOME=/home/qiime2

USER root
RUN echo "Creating ${NB_USER} user..." \
    # Create a group for the user to be part of, with gid same as uid
    && groupadd --gid ${NB_UID} ${NB_USER}  \
    # Create non-root user, with given gid, uid and create $HOME
    && useradd --create-home --gid ${NB_UID} --no-log-init --uid ${NB_UID} ${NB_USER} \
    # Make sure that /opt (where conda lives) is owned by non-root user, so we can install things there
    && chown -R ${NB_USER}:${NB_USER} /opt

USER ${NB_USER} 

# add the packages needed for jupyterhubs to the base environment
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f jhub-environment.yml && conda clean --all

# add packages needed for extra kernels in the notebooks
RUN conda install --name snakemake ipykernel && conda clean --all
RUN conda install --name qiime2-2023.5 ipykernel && conda clean --all

WORKDIR ${HOME}
