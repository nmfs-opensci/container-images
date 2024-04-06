FROM pangeo/base-image:2023.01.13
# pango base will look for environment.yml and apt.txt and install

# activate notebook env that pangeo base creates
RUN conda init zsh && conda init bash

# USER root

# faster solver
# RUN mamba install -n notebook --yes -c esri 'arcgis=2.0.0'
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0

USER ${NB_USER}

WORKDIR ${HOME}