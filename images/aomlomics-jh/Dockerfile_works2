FROM docker.io/aomlomics/tourmaline:latest

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

# Copy jupyter_notebook_config.py /etc/jupyter so
# it will be read by jupyter processes when they start. This feature is
# not available in repo2docker.
COPY jupyter_notebook_config.py jupyter_notebook_config.py
RUN mkdir -p /etc/jupyter \
    && cp jupyter_notebook_config.py /etc/jupyter

USER ${NB_USER} 

# add the packages needed for jupyterhubs to the base environment
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f jhub-environment.yml && conda clean --all

# add packages needed for extra kernels in the notebooks
RUN conda install --name snakemake ipykernel && conda clean --all
RUN conda install --name qiime2-2023.5 ipykernel && conda clean --all

# Register the kernels so you can open in notebooks
RUN python -m ipykernel install --prefix ${CONDA_DIR}/envs/snakemake --name snakemake --display-name snakemake
RUN python -m ipykernel install --prefix ${CONDA_DIR}/envs/qiime2-2023.5 --name qiime2-2023.5 --display-name qiime2

WORKDIR ${HOME}
