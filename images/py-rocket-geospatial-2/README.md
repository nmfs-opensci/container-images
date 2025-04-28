# py-rocket-geospatial v2.0

This creates a base Python-R image with geospatial packages for Python and R. The Python environment is the Pangeo notebook environment + extra geospatial libraries (similar to CryoCloud). The R environment is Rocker geospatial plus a few other packages. The image also includes a linux Desktop with QGIS, CoastWatch Utilities, and Panoply.

TeXLive and Quarto are installed along with MyST and JupyterBook.

Python 3.12 is installed with a conda environment called notebook that is activated on opening the container. R 4.4.X is installed.

See the documentation on [py-rocket-base](https://nmfs-opensci.github.io/py-rocket-base/) for information on the image structure and design.