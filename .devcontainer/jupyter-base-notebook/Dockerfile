FROM quay.io/jupyter/base-notebook:latest

# Add the packages you want to environment.yml
COPY environment.yml environment.yml
RUN conda env update -f environment.yml && conda clean --all

RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

