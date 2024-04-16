# arcgis Python Dockerfile

Author: Tim Haverland (NOAA)

## License

* Dockerfile: Apache 2.0
* Jupyter Project base image: Is distributed under the terms of the Modified BSD License. [License](https://github.com/jupyter/docker-stacks/blob/main/LICENSE.md)
* [arcgis python api](https://github.com/Esri/arcgis-python-api) is distributed under Apache 2.0 license
* Note, if you access ESRI resources you will need a ArcGIS license but there there many free (open) ArcGIS data layers that you can use without a license.

## Description

This has a base Jupyter notebook with Python 3.9 and jupyterlab 2.0 which is required to get the map widget to work. There are not other geospatial packages in the image. See arcgis-geospatial for an image with some basic geospatial modules.
