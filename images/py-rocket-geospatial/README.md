# Readme

This creates a base R image built off rocker/verse with geospatial packages.

It meant to emulate the geospatial Python image used by NASA Openscapes for their training and tutorials.

https://github.com/NASA-Openscapes/corn/tree/main

Python 3.10 is installed with a conda environment called notebook that is activated on opening the container. The environment only has Python 3.10 and some packages required for JupyterHub.

The user name is rstudio (not jovyan) but the user $home is /home/jovyan so that all user files appear in the same place across images.

