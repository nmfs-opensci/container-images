# Python 3.9 image based off pangeo/base-image:2023.01.13 on May 16, 2023
FROM openscapes/python:f577786

# install additional package...

USER ${NB_USER}

RUN conda install --yes -c esri 'arcgis=2.0.0' && \
    conda clean --all -f -y

RUN conda install --yes jupytext && \
    conda clean --all -f -y

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0
