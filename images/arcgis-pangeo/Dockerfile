FROM pangeo/base-image:2023.01.13
# pango base will look for environment.yml and apt.txt and install

# activate notebook env that pangeo base creates
RUN conda init zsh && conda init bash

USER ${NB_USER}

# broken here; complaining re node.js and npm
#RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
#    jupyter labextension install arcgis-map-ipywidget@2.0.0


WORKDIR ${HOME}