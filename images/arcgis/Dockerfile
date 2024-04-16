LABEL org.opencontainers.image.authors="tim.haverland@noaa.gov"
LABEL org.opencontainers.image.source=https://github.com/nmfs-opensci/container-images/arcgis
LABEL org.opencontainers.image.description="ArcGIS Python module image that will run in a JupyterHub"
LABEL org.opencontainers.image.licenses=Apache2.0

FROM jupyter/base-notebook:lab-2.2.9
    
RUN conda install --yes -c esri 'arcgis=2.0.0' && \
    conda clean --all -f -y

RUN conda install --yes jupyterlab-git jupytext && \
    conda clean --all -f -y

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0

COPY apt.txt /tmp/apt.txt

USER root

RUN echo "Installing Apt-get packages..." \
    && apt-get update --fix-missing > /dev/null \
    && apt-get install -y apt-utils wget zip tzdata > /dev/null \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
	
RUN echo "Installing helpful packages..." \
	&& apt-get update --fix-missing > /dev/null \
    # Read apt.txt line by line, and execute apt-get install -y for each line in apt.txt
    && xargs -a /tmp/apt.txt apt-get install -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

USER ${NB_USER}

RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
