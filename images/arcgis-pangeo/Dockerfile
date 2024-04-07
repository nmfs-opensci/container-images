# Python 3.9 image based off pangeo/base-image:2023.01.13 on May 16, 2023
FROM openscapes/python:f577786

# install additional package...

USER ${NB_USER}

RUN conda remove jupyterlab-link-share --name notebook 
# RUN mamba uninstall jupyterlab-link-share --name notebook 

#RUN conda install --yes -c conda-forge 'jupyterlab=2.2.9' 'conda=22.9.0' && \
#    conda clean --all -f -y

#RUN conda install --yes --name notebook 'arcgis=2.0.0' -c esri && \
#    conda clean --all -f -y

# make sure we install in the notebook environment which is default in the
# Openscapes image
COPY environment.yml arcgis-environment.yml
RUN mamba env update --name notebook -f arcgis-environment.yml && \
    mamba clean --all
RUN rm arcgis-environment.yml

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2
RUN jupyter labextension install arcgis-map-ipywidget@2.0.0
