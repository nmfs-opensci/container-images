FROM ghcr.io/nmfs-opensci/container-images/nmfs-opensci-python-base:latest

# set-up the base cmip6-cookbook environment and create a kernel
ENV NEWENV=cmip6
COPY environment.yml environment.yml
RUN mamba env create -n ${NEWENV} -f environment.yml
RUN rm environment.yml
RUN python -m ipykernel install --prefix ${CONDA_DIR}/envs/${NEWENV} --name ${NEWENV}

USER ${NB_USER}

