# Moving git install to the end in an attempt to preserve runner memory for the jupyter extension installs/builds
FROM jupyter/base-notebook:lab-2.2.9

RUN conda install --yes 'jupyter-server-proxy=3.2.2' && \
    conda clean --all -f -y
    
RUN conda install --yes -c esri 'arcgis=2.0.0' && \
    conda clean --all -f -y

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0

RUN conda install --yes 'git=2.30.2'

RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
