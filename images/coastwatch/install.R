#! /usr/local/bin/Rscript
# install R dependencies

# to match rocker/verse:4.4 used in py-rocker-base
# look up the date that the image was created and put that
repo <- "https://p3m.dev/cran/__linux__/jammy/2024-05-13"
list.of.packages <- c("ncdf4", "httr", "plyr", "lubridate", "parsedate", "rerddap",
                      "maps", "mapdata", "RColorBrewer",
                      "ggplot2","scales", "dplyr", "RCurl", "raster", "colorRamps",
                      "parsedate", "sp", "sf", "reshape2", "jsonlite",
                      "gridGraphics", "PBSmapping", "date", "viridis",
                      "openair","cmocean", "terra",
                      "plotdap", "rerddapXtracto", "rgdal")
install.packages(list.of.packages, repos=repo)
