# py-rocket-geospatial v2.0

This creates a base Python-R image built off repo2docker with geospatial packages for Python and R. The Python environment is similar to NASA Openscapes JupyterHub image [corn](https://github.com/NASA-Openscapes/corn/tree/main) and the CryoCloud JupyterHub [image](https://github.com/CryoInTheCloud/hub-image). The image also includes a linux Desktop with QGIS, CoastWatch Utilities, and Panoply.

Python 3.11 is installed with a conda environment called notebook that is activated on opening the container. 

See the documentation on [py-rocket-base](https://nmfs-opensci.github.io/py-rocket-base/) for information on the image structure and design.