# Readme

This creates a basic R image built off rocker/verse.

Python 3.10 is installed with a conda environment called notebook that is activated on opening the container. The environment only has Python 3.10 and some packages required for JupyterHub.

The user name is rstudio (not jovyan) but the user $home is /home/jovyan so that all user files appear in the same place across images.