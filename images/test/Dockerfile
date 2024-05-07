# devcontainer-focused Rocker
FROM ghcr.io/rocker-org/devcontainer/tidyverse:4.3

## latest version of geospatial libs
RUN /rocker_scripts/experimental/install_dev_osgeo.sh
RUN apt-get update -qq && apt-get -y install vim gh git-lfs awscli

# latest GDAL
RUN pip install --no-cache-dir --find-links https://girder.github.io/large_image_wheels GDAL
