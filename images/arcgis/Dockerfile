# 
FROM jupyter/base-notebook:lab-2.2.9

# conda is ancient in this old version of base-notebook but needed for Python 3.9
RUN conda install -n base conda=22.11.1
RUN conda update -n base conda
# faster solver in the more recent conda releases
RUN conda config --set solver libmamba

RUN conda install -n base --yes -c esri 'arcgis=2.0.0'
RUN conda install -n base --yes -c conda-forge xarray dask netCDF4 bottleneck
RUN conda install -n base --yes -c conda-forge rasterio
RUN conda install -n base --yes -c conda-forge geopandas
RUN conda clean --all -f -y

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0

# version control for jupyter notebooks
RUN conda install -n base --yes jupytext -c conda-forge && \
    conda clean --all -f -y

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
