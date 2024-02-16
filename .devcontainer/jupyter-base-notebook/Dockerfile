FROM quay.io/jupyter/base-notebook:latest

# Add the packages you want to environment.yml
COPY environment.yml environment.yml
RUN mamba install --yes --file environment.yml && \
    mamba clean --all -f -y

RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

