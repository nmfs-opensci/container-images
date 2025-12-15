
<!-- DO NOT EDIT. CREATED BY README.RMD. Knit that. -->

# <a name="top">NMFS Open Science Docker Stack

These are a collection of container images that provide standardized
environments for Python and R with Jupyter Lab, RStudio and VS Code
IDEs. The images are built off the
[Rocker](https://rocker-project.org/images/devcontainer/images.html),
[Pangeo](https://github.com/pangeo-data/pangeo-docker-images) and
[Jupyter](https://jupyter-docker-stacks.readthedocs.io/en/latest/) base
images. This repo holds the stable Docker stack for specific pipelines
used in Fisheries. The images are designed to work out-of-box and
identically in Jupyter Hubs, Codespaces, Binder, etc.Read the Design
section below on what the NMFS Open Sci Docker Stack does. For use, see
[Instructions](#instructions) and [Link to files](#files). This Docker
Stack was the joint of a number of people. See
[Acknowledgements](#thanks).

## Stable set of images

There are many other images in the `images` folder that are experimental
in nature. *If you are looking for standard Python or R Docker images,
go to the base Docker stacks linked above.*

| Image | Description | Open | info |
|----|----|----|----|
| [py-rocket-base](https://github.com/nmfs-opensci/py-rocket-base/pkgs/container/py-rocket-base) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/py-rocket-base/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/py-rocket-base/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Use as the base Python-R image | [Documentation](https://nmfs-opensci.github.io/py-rocket-base/) | [repo](https://github.com/nmfs-opensci/py-rocket-base) |
| [py-rocket-geospatial-2](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-rocket-geospatial-2) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-rocket-geospatial-2/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/py-rocket-geospatial-2/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Geospatial Python (3.12) and R (4.4.3) image with Desktop (QGIS, Panoply, CWUtils)<br/> <small>ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial-2:latest</small> | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/py-rocket-geospatial-2/devcontainer.json) <br/> | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial-2/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial-2) |
|  |  |  |  |
| **Specialized** | Images for specific analyses |  |  |
| [asar](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fasar) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fasar/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/asar/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | asar: run asar stock assessment reports.<br/> <small>ghcr.io/nmfs-opensci/container-images/asar:latest</small> | <br/> | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/asar/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/asar) |
| [py-geospatial](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-geospatial) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-geospatial/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/py-geospatial/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Geospatial Python (3.12)<br/> <small>ghcr.io/nmfs-opensci/container-images/py-geospatial:latest</small> | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/py-geospatial/devcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/py-geospatial) | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-geospatial/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/py-geospatial) |
| [r-geospatial](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fr-geospatial) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fr-geospatial/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/r-geospatial/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Geospatial R (vrs 4.4) image<br/> <small>ghcr.io/nmfs-opensci/container-images/r-geospatial:latest</small> | <br/> | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/r-geospatial/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/r-geospatial) |
| [r-geospatial-sdm](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fr-geospatial-sdm) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fr-geospatial-sdm/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/r-geospatial-sdm/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Geospatial R (vrs 4.4) image with Species Dist Modeling packages including sdmTMB<br/> <small>ghcr.io/nmfs-opensci/container-images/r-geospatial-sdm:latest</small> | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/r-geospatial-sdm/devcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/r-geospatial-sdm) | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/r-geospatial-sdm/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/r-geospatial-sdm) |
| [arcgis](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Farcgis) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Farcgis/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/arcgis/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | ArcGIS Python module image that will run in a JupyterHub<br/> <small>ghcr.io/nmfs-opensci/container-images/arcgis:latest</small> | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/arcgis/devcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/arcgis) | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/arcgis/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/arcgis) |
| [coastwatch](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fcoastwatch) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fcoastwatch/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/coastwatch/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | CoastWatch image for satellite training courses<br/> <small>ghcr.io/nmfs-opensci/container-images/coastwatch:latest</small> | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/coastwatch/devcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/coastwatch) | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/coastwatch/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/coastwatch) |
| [vast](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fvast) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fvast/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/vast/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | VAST with R 4.3.3<br/> <small>ghcr.io/nmfs-opensci/container-images/vast:latest</small> | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/vast/devcontainer.json) <br/> | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/vast/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/vast) |
| [aomlomics-jh](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Faomlomics-jh) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Faomlomics-jh/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/aomlomics-jh/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Tourmaline is an amplicon sequence processing workflow for Illumina sequence data that uses QIIME 2 and the software packages it wraps.<br/> <small>ghcr.io/nmfs-opensci/container-images/aomlomics-jh:latest</small> | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/aomlomics-jh/devcontainer.json) <br/> | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/aomlomics-jh/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/aomlomics-jh) |
| [py-rocket-geospatial](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-rocket-geospatial) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-rocket-geospatial/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/py-rocket-geospatial/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Geospatial Python (3.12) and R (4.4.3) image<br/> <small>ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial:latest</small> | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/py-rocket-geospatial/devcontainer.json) <br/> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nmfs-opensci/container-images/py-rocket-geospatial) | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial) |
| [py-rocket-geospatial-qgis](https://github.com/nmfs-opensci/container-images/pkgs/container/container-images%2Fpy-rocket-geospatial-qgis) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci/container-images%2Fpy-rocket-geospatial-qgis/size?color=%2344cc11&tag=latest&label=image+size&trim=) <br/> ![](https://ghcr-badge.egpl.dev/nmfs-opensci%2Fcontainer-images/py-rocket-geospatial-qgis/latest_tag?color=%2344cc11&ignore=latest&label=version&trim=) | Geospatial Python (3.12) and R (4.4.3) image with Desktop (QGIS, Panoply, CWUtils)<br/> <small>ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial-qgis:latest</small> | <br/> | [dockerfile](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial-qgis/Dockerfile) <br/> [directory](https://github.com/nmfs-opensci/container-images/tree/main/images/py-rocket-geospatial-qgis) |
| **Community** | Images from other Docker Stacks |  |  |
| [pangeo-notebook](https://github.com/pangeo-data/pangeo-docker-images/tree/master/pangeo-notebook) <br/> ![](https://img.shields.io/docker/image-size/pangeo/pangeo-notebook?sort=date) <br/> | Pangeo Notebook | [![Button GCS](https://img.shields.io/badge/launch-codespace-brightgreen?logo=github)](https://codespaces.new/nmfs-opensci/container-images?devcontainer_path=.devcontainer/pangeo-notebook/devcontainer.json) | [directory](https://github.com/pangeo-data/pangeo-docker-images/tree/master/pangeo-notebook) |
| [rocker-binder](https://github.com/rocker-org/rocker-versioned2/pkgs/container/binder/374714295?tag=latest) <br/> ![](https://img.shields.io/docker/image-size/rocker/binder?sort=date) <br/> | Rocker binder based on rocker-geospatial [Documentation](https://rocker-project.org/images/versioned/binder.html) | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/rocker-org/binder/HEAD?urlpath=rstudio) | [repo](https://github.com/rocker-org/rocker-versioned2/tree/master) |

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
- When an image contains both R and Python, the base image is a rocker
  image and adheres to the rocker norms for R and RStudio environment
  design. For the Python side of these images, micromamba is installed
  and the Pangeo conda environment structure is applied as in the Python
  only images. RStudio will use the Python environment in the conda
  notebook environment when Python is used from within RStudio. The user
  is `rstudio` but the home directory is `home/jovyan` so images play
  nice with standard JupyterHub deployments with persistent memory.
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

**Related Docker Stacks**

- [NASA Openscapes corn]() and [NASA Openscapes py-rocket]()
- [Rocker](https://rocker-project.org/images/devcontainer/images.html)
- [Pangeo](https://github.com/pangeo-data/pangeo-docker-images)
- [Jupyter](https://jupyter-docker-stacks.readthedocs.io/en/latest/)
- [geocompx](https://github.com/geocompx/docker)
- [GPU accelerated docker images and
  devcontainers](https://github.com/b-data)

### <a name="thanks">Acknowledgements

The motivation of the Docker Stack was the success of the NASA
Openscapes “corn” image developed by Luis Lopez (NASA) and used in
countless workshops on cloud-computing with NASA Earth Data.
Subsequently the NASA Openscapes mentor cloud-infrastructure Slack group
met during weekly co-work sessions and plugged away at the problem of
helping users ‘fledge’ off the Openscapes JupyterHub, which involved
creating images that could be used outside of JupyterHubs, and updating
the original “py-rocket” R image created by Luis. Carl Boettiger (UC
Berkeley & Rocker Project) and Eli Holmes (NOAA Fisheries) took on
different aspects of this work. The GitHub Action tooling is curtesy of
Carl. “py-rocket-base” is derived from Carl’s “version 2.conda” of
py-rocket. Eli further developed py-rocket into the form in this repo to
bring it closer to the “corn” and Pangeo designs. Yuvi Panda (Jupyter,
2i2c) was instrumental in helping sort through so many mystery bugs. The
Codespaces and devcontainer code is based on Michael Akridge’s [Open
Science
Codespaces](https://github.com/MichaelAkridge-NOAA/Open-Science-Codespaces)
work. Individual images have different core developers: Tim Haverland
(arcgis), Sunny Hospital (coastwatch), Luke Thompson (aomlomics-jh), Eli
Holmes (the various py-rocket versions).

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

# <a name="instructions">Instructions for using the images

[back to readme](#top)

There are many ways to use Docker images. Here are common ones. Scroll
to the bottom for instructions on linking your container to file systems
(so you can get and store files).

## To run images in a JupyterHub with ‘bring your image’

If your JupyterHub has this option:

- Click on the ‘Bring your own image’ radio button at bottom
- Paste in url to your image (or any other image)
- You will find the urls in the right nav bar under ‘Packages’
- Example `ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial-2:latest`

## Run with a JupyterHub

Should work out of the box. Put the url to the image whereever you would
use images.

## Run with docker

You can run the images on a Virtual Machine or your computer if you have
Docker or Podman installed.

    docker run -p 8888:8888 ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

On a Mac M2+ with Rosetta emulation turned on in the Docker Desktop
settings.

    docker run --platform linux/amd64 -p 8888:8888 ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

In the terminal look for something like and put that in a browser.

    http://127.0.0.1:8888/lab?token=6d45c7d88aba92a815647c

**Running geospatial R Docker images and working with netCDF files**

GDAL netCDF driver needs some extra flags added to the `docker run` for
GDAL to work correctly when run inside a Docker container. This doesn’t
affect Python as much since `xarray` works with netCDF via different
drivers, but the `terra` netCDF functions use GDAL drivers under the
hood to open netCDF files. You’ll get error saying it can’t find files.
We ran into trouble when accessing cloud-hosted netCDF files. Perhaps it
works ok if you download the files.

Add this to the call:

    --cap-add SYS_PTRACE --security-opt seccomp=unconfined

so you call will look like:

    docker run -p 8888:8888 --cap-add SYS_PTRACE --security-opt seccomp=unconfined ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial-2:latest

Note we had trouble getting this to work on an Mac with Apple chips. You
can test if it is going to work by running this Python code and seeing
if `you can see if`DCAP_VIRTUALIO\` is listed:

    from osgeo import gdal
    nc = gdal.GetDriverByName("netCDF")
    nc.GetMetadata().keys()

## Run with Binder

Create a file called `Dockerfile` and put in the base of your GitHub
repository or in a folder called `binder` or `.binder`. Into that file
put the following line (replacing the image url to match your desired
image).

    FROM ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial-2:latest

Then go to <https://mybinder.org> and paste in the url to your GitHub
repo or alternatively go to the following url directly:

    https://mybinder.org/v2/gh/<username or org>/<reponame>

## With Codespaces

See the folders in the `.devcontainer` folder and create a
`.devcontainer/devcontainer.json` file in your own repo by copying one
of `devcontainer.json` file. They all use the same template with just
the top lines changed. Note that the folder `.devcontainer/codespace` is
also required. If you change the line that starts up Jupyter Lab (at the
bottom of the devcontainer.json file, do not use port 8888 or else
RStudio will not launch.

The Codespaces code is based on:
<https://github.com/MichaelAkridge-NOAA/Open-Science-Codespaces>

## GitPod – like Codespaces

Work in progress. Approach is similar to Codespaces.

## Run on Google Colab

TBD. This seems harder. See this
[issue](https://github.com/nmfs-opensci/container-images/issues/14)

# <a name="files"> Getting access to files

[back to readme](#top)

The container gives you a computing environment, but by design, it is a
container and not connected to the file system in whatever is running
the container. So you will need to get your files in/out of the
container and have a way to save your work.

## Upload/Download files

Under the Files menu in Jupyter Lab or the Files tab in RStudio, you can
upload and download files.

## Use a Git repository

Jupyter Lab and RStudio have Git GUIs. Use those or the command line to
clone repos and push changes back to the repos.

    cd ~
    git clone <url to the repo>

## Connect to a bucket

If you are working with large data sets, you do not want to move these
into your container (slow, slow). You will want to create a bucket (like
an S3 bucket) and connect to that. This is like having a external drive
in the cloud.

Instructions to come.

## Mount a file system

You can mount a local file system and read/write directly from that.
Here “local” means the machine that is running the container. “local”
might be a virtual machine, a server or your computer.

**On a JupyterHub**: The managers of the hub most likely have created
persistent memory for you. If not, use Git, upload/download, or use
buckets.

**On your computer**: you’ll add a flag to the `docker run` command to
mount your local file system to the Docker container.

When you use `--volume` to bind-mount a file or directory, make sure it
does not exist on the Docker container. So do not bind a directory like
`\usr` which would destroy the container (nothing bad; it just won’t
work). Use something like `\home\jovyan\mydir`. `--volume` creates the
endpoint for you and it is always created as a directory.

In this example, `mydir` needs to exist in the directory where you are
running `docker run`. If you get errors, try `ls` to make sure the
directory is there.

    docker run --platform linux/amd64 -p 8888:8888 --volume ./myproject_files:/home/jovyan/mydir ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

as you work in `mydir` in the container, those changes will appear in
your computer’s `myproject_files` directory. It is as if you are working
on your own computer, but you are using the development environment of
the docker file.

Mac users with Apple chips, add `--platform linux/amd64`:

    docker run --platform linux/amd64 -p 8888:8888 --volume ./myproject_files:/home/jovyan/mydir ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

## Use py-rocket-base as a base image

Create a file called `Dockerfile`

    FROM ghcr.io/nmfs-opensci/container-images/py-geospatial:latest

add more code in that file. See the `images` and `draft_images` folders
for examples.

Use a GitHub Action to automatically build and push the image to ghcr.io
(GitHub packages, associated with every repo). This action is triggered
whenever your dockerfile changes.

    name: Docker Image CI

    on:
      workflow_dispatch:
      push:
        branches:
          - main
        paths:
          - 'Dockerfile'

    jobs:
      build-and-push:
        uses: nmfs-opensci/container-images@main
