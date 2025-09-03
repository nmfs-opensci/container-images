# psaw-workshop

This creates a base Python-R image with some light geospatial packages for Python and R. The Python environment is a light version of the Pangeo notebook environment. The R environment is a light version of Rocker geospatial plus a few other packages. The image also includes a linux Desktop with Positron and Zotero.

TeXLive and Quarto (v1.7.34) are installed along with MyST and JupyterBook.

Python 3.12 is installed with a conda environment called notebook that is activated on opening the container. R 4.4.X is installed.

See the documentation on [py-rocket-base](https://nmfs-opensci.github.io/py-rocket-base/) for information on the image structure and design.