# Still no map but does start up in the base environment and uses latest
FROM jupyter/base-notebook:lab-2.2.9

RUN conda install --yes 'git'

RUN conda install --yes 'jupyter-server-proxy=3.2.2' && \
    conda clean --all -f -y
    
RUN conda install --yes -c esri 'arcgis=2.0.0' && \
    conda clean --all -f -y

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0

RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
