# py-rocket-geospatial v2.0

This creates a base Python-R image with geospatial packages for Python and R. The Python environment is the Pangeo notebook feedstock + extra geospatial libraries (similar to CryoCloud). The R environment is Rocker geospatial plus a few other packages. The image also includes a linux Desktop with QGIS, CoastWatch Utilities, and Panoply.

TeXLive and Quarto are installed along with MyST and JupyterBook.

Python 3.11 is installed with a conda environment called notebook that is activated on opening the container. R 4.5.X is installed.

The python packages are split across 5 files that are installed into the conda environment sequentially: env-core1.yml, env-core2.yml, env-geo.yml, env-viz.yml, env-qgis.yml. This is done to make the solve easier (5 minutes versus over 3 hours).

See the documentation on [py-rocket-base](https://nmfs-opensci.github.io/py-rocket-base/) for information on the image structure and design.
