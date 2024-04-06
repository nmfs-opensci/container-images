# Python 3.9 image based off pangeo/base-image:2023.01.13 on May 16, 2023
FROM openscapes/python:f577786

# install additional package...

USER ${NB_USER}

RUN conda install --yes -c conda-forge 'jupyterlab=2.2.9' && \
    conda clean --all -f -y

RUN conda install --yes 'arcgis=2.0.0' -c esri -c conda-forge && \
    conda clean --all -f -y

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0
# make sure we install in the notebook environment which is default in the
# Openscapes image
COPY environment.yml arcgis-environment.yml
RUN mamba env update --name notebook -f arcgis-environment.yml && \
    mamba clean --all
RUN rm arcgis-environment.yml

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0
