# Still no map but does start up in the base environment and uses latest
FROM quay.io/jupyter/base-notebook:latest

RUN mamba install --yes 'jupyter-server-proxy' && \
    mamba clean --all -f -y
    
RUN mamba install --yes -c esri 'arcgis' && \
    mamba clean --all -f -y

RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
