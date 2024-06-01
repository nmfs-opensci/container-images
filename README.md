
<!-- DO NOT EDIT. CREATED BY README.RMD. Knit that. -->

# NMFS Open Science Docker Stack

### Beta release June 1, 2024.

These are a collection of container images that provide standardized
environments for Python and R with Jupyter Lab, RStudio and VS Code
IDEs. The images are built off the
[Rocker](https://rocker-project.org/images/devcontainer/images.html),
[Pangeo](https://github.com/pangeo-data/pangeo-docker-images) and
[Jupyter](https://jupyter-docker-stacks.readthedocs.io/en/latest/) base
images. This repo holds the stable Docker stack for specific pipelines
used in Fisheries. The images are designed to work out-of-box and
identically in Jupyter Hubs, Codespaces, Binder, etc.Read the Design
section below on what the NMFS Open Sci Docker Stack does. For use
instructions, see
[INSTRUCTIONS.md](https://nmfs-opensci/container-images/INSTRUCTIONS.md).

## Stable set of images

There are many other images in the `images` folder that are experimental
in nature. *If you are looking for standard Python or R Docker images,
go to the base Docker stacks linked above.*

| Image                                                                                                                                                                                                                                                                                                                                                                                                                                       | Description                                                                                                                             | Open                                                                                                                                                                                                                                                                                                                                                              | info                                                                                                                                                                                                                     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Base**                                                                                                                                                                                                                                                                                                                                                                                                                                    | Use as the base image when possible                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                   |                                                                                                                                                                                                                          |
| [py-geospatial](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-geospatial) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-geospatial/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/py-geospatial/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=)                             | NASA Openscapes Python image used in workshops                                                                                          | [![Button GCS](https://img.shields.io/badge/Open_in_Codespace-37a779?style=for-the-badge)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer%2Fpy-geospatial%2Fdevcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/py-geospatial)               | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-geospatial/Dockerfile) <br> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/py-geospatial)               |
| [py-rocket-base](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-rocket-base) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-rocket-base/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/py-rocket-base/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=)                         | Tidyverse based R image with Python                                                                                                     | [![Button GCS](https://img.shields.io/badge/Open_in_Codespace-37a779?style=for-the-badge)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer%2Fpy-rocket-base%2Fdevcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/py-rocket-base)             | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-base/Dockerfile) <br> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-base)             |
| [py-rocket-geospatial](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-rocket-geospatial) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-rocket-geospatial/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/py-rocket-geospatial/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Geospatial Python and Geospatial R image                                                                                                | [![Button GCS](https://img.shields.io/badge/Open_in_Codespace-37a779?style=for-the-badge)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer%2Fpy-rocket-geospatial%2Fdevcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/py-rocket-geospatial) | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial/Dockerfile) <br> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial) |
|                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                                                                                                                         |                                                                                                                                                                                                                                                                                                                                                                   |                                                                                                                                                                                                                          |
| **Specialized**                                                                                                                                                                                                                                                                                                                                                                                                                             | Images for specific analyses                                                                                                            |                                                                                                                                                                                                                                                                                                                                                                   |                                                                                                                                                                                                                          |
| [arcgis](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Farcgis) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Farcgis/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/arcgis/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=)                                                         | ArcGIS Python module image that will run in a JupyterHub                                                                                | [![Button GCS](https://img.shields.io/badge/Open_in_Codespace-37a779?style=for-the-badge)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer%2Farcgis%2Fdevcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/arcgis)                             | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/arcgis/Dockerfile) <br> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/arcgis)                             |
| [coastwatch](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fcoastwatch) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fcoastwatch/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/coastwatch/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=)                                         | CoastWatch image for satellite training courses                                                                                         | [![Button GCS](https://img.shields.io/badge/Open_in_Codespace-37a779?style=for-the-badge)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer%2Fcoastwatch%2Fdevcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/coastwatch)                     | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/coastwatch/Dockerfile) <br> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/coastwatch)                     |
| [echopype](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fechopype) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fechopype/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/echopype/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=)                                                 | echopype tooling for ocean sonar data processing in Python. Author: Wu-Jung Lee + echopype team.                                        | [![Button GCS](https://img.shields.io/badge/Open_in_Codespace-37a779?style=for-the-badge)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer%2Fechopype%2Fdevcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/echopype)                         | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/echopype/Dockerfile) <br> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/echopype)                         |
| [vast](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fvast) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fvast/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/vast/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=)                                                                 | VAST with R 4.3.3                                                                                                                       | [![Button GCS](https://img.shields.io/badge/Open_in_Codespace-37a779?style=for-the-badge)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer%2Fvast%2Fdevcontainer.json) <br/>                                                                                                                                                 | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/vast/Dockerfile) <br> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/vast)                                 |
| [aomlomics-jh](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Faomlomics-jh) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Faomlomics-jh/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/aomlomics-jh/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=)                                 | Tourmaline is an amplicon sequence processing workflow for Illumina sequence data that uses QIIME 2 and the software packages it wraps. | [![Button GCS](https://img.shields.io/badge/Open_in_Codespace-37a779?style=for-the-badge)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer%2Faomlomics-jh%2Fdevcontainer.json) <br/>                                                                                                                                         | [Dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/aomlomics-jh/Dockerfile) <br> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/aomlomics-jh)                 |

*Click on the image name in the table above for a current list of
installed packages and versions*

## Design principles

The images are designed to be deployable “out of the box” from
JupyterHubs, Codespaces, GitPod, Colab, Binder, and on your computer via
Docker or Podman with no modification. See instructions below. Each will
spin up Jupyter Lab with Jupyter Lab (and Notebook), RStudio and VS Code
with the specific development environment.

- Python environment follows Pangeo images with micromamba installed as
  the solver and base and notebook environments. The Jupyter modules are
  installed in notebook conda environment and images will launch with
  the notebook environment activated, again following Pangeo design
  structure. Images that use Pangeo as base will have user jovyan and
  user home directory home/jovyan.
- Images with R ONLY follow Rocker’s environment design with the
  exception that the user home directory is home/jovyan so it plays nice
  with JupyterHub deployments. The user is rstudio however.
- When an image contains both R and Python, the base image is rocker and
  micromamba is installed along with the Pangeo environment structure.
  RStudio will use the Python environment in the notebook conda
  environment when Python is used from within RStudio.
- These images are not terribly light-weight (they are large). Use the
  original Jupyter, Pangeo or Rocker images if you are looking for
  lightweight data science images.

## Why use a container?

The main reason is that geospatial, bioinformatics, and TMB/INLA
environments can be hard to get working right. Using a Docker image
means you use a stable environment. Watch this video from Yuvi Panda
(Jupyter Project) [video](https://www.youtube.com/watch?v=qgLPpULvBbQ)
and read about the Rocker Project in the R Project Journal
[article](https://journal.r-project.org/archive/2017/RJ-2017-065/RJ-2017-065.pdf)
by Carl Boettiger and Dirk Eddelbuettel.

### Acknowledgements

The core stack is credited to the work of Luis Lopez (NASA) who
developed the NASA Openscapes Python image used in countless workshops
on cloud-computing with NASA Earth Data. Subsequently the NASA
Openscapes mentor cloud-infrastructure Slack group and weekly co-work
sessions plugged away at the problem of helping users ‘fledge’ off the
Openscapes JupyterHub, which involved creating images that were more
versitile. Carl Boettiger (UC Berkeley & Rocker Project) and Eli Holmes
(NOAA Fisheries) took on different aspects of this. The GitHub Action
tooling is curtesy of Carl. Yuvi Panda (Jupyter, 2i2c) was also very
helpful in desiging the ‘scaffolding’ in the images that helps them be
robust and versitile. The Codespaces and devcontainer code is based on
Michael Akridge’s [Open Science
Codespaces](https://github.com/MichaelAkridge-NOAA/Open-Science-Codespaces)
work. Individual images have different core developers: Tim Haverland
(arcgis), Sunny Hospital (coastwatch), Luke Thompson (aomlomics).

## License information

All code used in the images is under open licenses. Some is copy-left
which means if you modify their code (we don’t), you need to also
provide your source code. The Dockerfile code is released under Apache
2.0, a very permissive open source license which does not require that
you make you own modifications open. See the README.md files for the
licenses for specific code used in the Docker files.

- The Dockerfiles are released under Apache 2.0.
- [jupyterhub](https://github.com/jupyterhub/jupyterhub?tab=License-1-ov-file#readme)
  : Modified BSD License
- [juptyerlab](https://github.com/jupyterlab/jupyterlab?tab=License-1-ov-file#readme):
  Open license
- [Openscapes base Python
  image](https://github.com/nasa-openscapes/corn): MIT
- [Pangeo Docker
  Stack](https://github.com/pangeo-data/pangeo-docker-images): MIT
- [Python](https://docs.python.org/3/license.html): Zero clause BSD
- [Openscapes base rocker
  image](https://github.com/nasa-openscapes/py-rocket): MIT
- [Rocker Docker
  Stack](https://github.com/rocker-org/rocker-versioned2?tab=GPL-2.0-1-ov-file#readme):
  GPL-2
- [R](https://www.r-project.org/Licenses/): GPL-2, GPL-3
- RStudio Server: GPL-3
- conda and mamba solvers: are open source projects with 3-clause BSD
  license. Anaconda is not used in these images nor are the Anaconda
  repositories.

<hr>

## Disclaimer

This repository is a scientific product and is not official
communication of the National Oceanic and Atmospheric Administration, or
the United States Department of Commerce. All NOAA GitHub project
content is provided on an ‘as is’ basis and the user assumes
responsibility for its use. Any claims against the Department of
Commerce or Department of Commerce bureaus stemming from the use of this
GitHub project will be governed by all applicable Federal law. Any
reference to specific commercial products, processes, or services by
service mark, trademark, manufacturer, or otherwise, does not constitute
or imply their endorsement, recommendation or favoring by the Department
of Commerce. The Department of Commerce seal and logo, or the seal and
logo of a DOC bureau, shall not be used in any manner to imply
endorsement of any commercial product or activity by DOC or the United
States Government.
