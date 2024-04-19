# NMFS Open Science Docker Stack

## THE DOCKER STACK IS IN ACTIVE DESIGN and DEVELOPMENT 

### Beta release targeted for June 1, 2024.

These are a collection of container images to provide standardized environments for Python and R computing build off the [Rocker](https://rocker-project.org/images/devcontainer/images.html), [Pangeo](https://github.com/pangeo-data/pangeo-docker-images) and Jupyter base images. This repo holds the (mostly) stable docker stack for specific pipelines used in Fisheries. Our development and testing sandbox is here: [nmfs-opensci/container-images](https://github.com/nmfs-opensci/container-images) which is our sandbox and development location. Why use a container? Watch this video from Yuvi Panda (Jupyter Project) [video](https://www.youtube.com/watch?v=qgLPpULvBbQ) and read about the Rocker Project in the R Project Journal [article](https://journal.r-project.org/archive/2017/RJ-2017-065/RJ-2017-065.pdf) by Carl Boettiger and Dirk Eddelbuettel.

## Design principles

* Python environment follows Pangeo images with micromamba installed as the solver and base and notebook environments. The Jupyter modules are installed in notebook environment and images will launch with the notebook activated, again following Pangeo design structure. Images that use Pangeo as base will have user jovyan and user home directory home/jovyan.
* R set-up follows Rocker's environment design with the exception that the user home directory is home/jovyan so it plays nice with JupyterHub deployments. The user is rstudio however.
* When an image contains both R and Python, the base image is rocker and micromamba is installed along with the Pangeo environment structure. RStudio will use the Python environment in the notebook environment when Python is used from within RStudio.
* The images are designed to be deployable from JupyterHubs, Codespaces, GitPod, Colab, Binder, and on your computer via Docker or Podman. See instructions below.
* However, they are not terribly light-weight (large). Use the original Jupyter, Pangeo or Rocker images if you are looking for simple lightweight data science images.

## Stable set of images

There are many other images in the `images` folder that are experimental in nature.
  

| Image           | Description                            | Size | Link | Dockerfile |
|-----------------|----------------------------------------|------|------|------------|
| nmfs-opensci-python-base   | Geospatial Python based on NASA Openscapes image  | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fnmfs-opensci-python-base/size?color=%2344cc11&tag=latest&label=image+size&trim=) | [nmfs-opensci-python-base](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fnmfs-opensci-python-base) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/nmfs-opensci-python-base)
| py-rocket-base   | Tidyverse based R image with Python  | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-rocket-base/size?color=%2344cc11&tag=latest&label=image+size&trim=) | [py-rocket-base](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-rocket-base) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-base)
| py-rocket-geospatial   | Geospatial R and Python image | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-rocket-geospatial/size?color=%2344cc11&tag=4.3.3-3.10&label=image+size&trim=) | [py-rocket-geospatial](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-rocket-geospatial) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial)
| arcgis          | For using ArcGIS within Jupyter Lab      | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Farcgis/size?color=%2344cc11&tag=latest&label=image+size&trim=) | [arcgis](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Farcgis) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/arcgis)
| coastwatch       | CoastWatch Python + R      | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fcoastwatch/size?color=%2344cc11&tag=latest&label=image+size&trim=) | [coastwatch](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fcoastwatch) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/coastwatch)
| cmip6-cookbook           | Tooling for working with CMIP6 climate simulations      | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fcmip6-cookbook/size?color=%2344cc11&tag=latest&label=image+size&trim=) | [cmip6-cookbook](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fcmip6-cookbook) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/cmip6-cookbook)
| echopype         | Tooling for ocean sonar (acoustics) data processing  | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fechopype/size?color=%2344cc11&tag=latest&label=image+size&trim=) | [echopype](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fechopype) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/echopype)
| VAST             | VAST with R 4.3.3  | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fvast/size?color=%2344cc11&tag=latest&label=image+size&trim=) | [vast](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fvast) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/vast)
| aomlomics-jh     | NOAA AOML omics image for amplicon sequence processing workflow (adapted for JupyterHub deployment)  | ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Faomlomics-jh/size?color=%2344cc11&tag=latest&label=image+size&trim=) | [aomlomics-jh](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Faomlomics-jh) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/aomlomics-jh)


*Click on the image name in the table above for a current list of installed packages and versions*

### Acknowledgements

The core stack is credited to the work of Luis Lopez (NASA) who developed the NASA Openscapes Python image used in countless workshops on cloud-computing with NASA Earth Data. Subsequently the NASA Openscapes mentor cloud-infrastructure Slack group and weekly co-work sessions plugged away at the problem of helping users 'fledge' off the Openscapes JupyterHub, which involved creating images that were more versitile. Carl Boettiger (Rocker, UC Berkeley) and Eli Holmes (NOAA Fisheries) took on different aspects of this. The GitHub Action tooling is curtesy of Carl. Yuvi Panda (Jupyter, 2i2c) was also very helpful in desiging the 'scaffolding' in the images that helps them be robust and versitile.

## To run images in a JupyterHub with 'bring your image'

If your JupyterHub has this option:

* Click on the 'Bring your own image' radio button at bottom
* Paste in url to your image (or any other image)
* You will find the urls in the right nav bar under 'Packages'
* Example `ghcr.io/nmfs-opensci/jupyter-base-notebook:latest`

## Run with a JupyterHub

Should work out of the box. Put the url to the image whereever you would use images.

## Run with docker

```
docker run -p 8888:8888 ghcr.io/nmfs-opensci/jupyter-base-notebook:latest
```

On a Mac M2+ with Rosetta emulation turned on in the Docker Desktop settings.
```
docker run --platform linux/amd64 -p 8888:8888 ghcr.io/nmfs-opensci/jupyter-base-notebook:latest
```

In the terminal look for something like and put that in a browser.
```
http://127.0.0.1:8888/lab?token=6d45c7d88aba92a815647c
```

## Run with Binder

Should work out of the box. Copy the Dockerfile into a repo and put the Dockerfile in the base or in a folder called `binder`. Then put this in a browser. Note many of the Docker images are big and somewhat hairy to build. This might not work in binder.

```
https://mybinder.org/v2/gh/user-name/reponame/main
```

## With Codespaces

Still working to streamline this.

## GitPod -- like Codespaces

Still working to streamline this.

## Run on Colab?

https://github.com/indigo-dc/udocker

Installation in the Jupyter notebook
```
%%shell
pip install udocker
udocker --allow-root install
udocker --allow-root run -p 127.0.0.1:8888:8888 -v -e ghcr.io/nmfs-opensci/jupyter-base-notebook:latest
```

## License information

All code used in the images is under open licenses. Some is copy-left which means if you modify their code (we don't), you need to also provide your source code. The Dockerfile code is released under Apache 2.0, a very permissive open source license which does not require that you make you own modifications open. See the README.md files for the licenses for specific code used in the Docker files.

* The Dockerfiles are released under Apache 2.0.
* [jupyterhub](https://github.com/jupyterhub/jupyterhub?tab=License-1-ov-file#readme) : Modified BSD License
* [juptyerlab](https://github.com/jupyterlab/jupyterlab?tab=License-1-ov-file#readme): Open license

* [Openscapes base Python image](https://github.com/nasa-openscapes/corn): MIT
* [Pangeo Docker Stack](https://github.com/pangeo-data/pangeo-docker-images): MIT
* [Python](https://docs.python.org/3/license.html): Zero clause BSD

* [Openscapes base rocker image](https://github.com/nasa-openscapes/py-rocket): MIT
* [Rocker Docker Stack](https://github.com/rocker-org/rocker-versioned2?tab=GPL-2.0-1-ov-file#readme): GPL-2
* [R](https://www.r-project.org/Licenses/): GPL-2, GPL-3
* RStudio Server: GPL-3

* conda and mamba solvers: are open source projects with 3-clause BSD license. Anaconda is not used in these images nor are the Anaconda repositories.

<hr>

## Disclaimer

This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project content is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.



Or this? https://stackoverflow.com/questions/62820498/how-to-connect-google-colab-with-localhost-running-docker-image

port forwarding https://biplobsd.me/blogs/view/run-swirl-open-source-search-engine-on-google-colab.md

