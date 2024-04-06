FROM pangeo/base-image:2023.01.13

RUN conda init zsh && conda init bash

RUN mamba install -n notebook --yes -c esri 'arcgis=2.0.0'

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0

USER ${NB_USER}

WORKDIR ${HOME}