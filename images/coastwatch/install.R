#! /usr/local/bin/Rscript
# install R dependencies

# to match rocker/geospatial:4.2 uses in openscapes/rocker:a7596b5
repo <- "https://p3m.dev/cran/__linux__/jammy/2023-04-20"
list.of.packages <- c("ncdf4", "httr", "plyr", "lubridate", "parsedate", "rerddap",
                      "maps", "mapdata", "RColorBrewer",
                      "ggplot2","scales", "dplyr", "RCurl", "raster", "colorRamps",
                      "parsedate", "sp", "sf", "reshape2", "jsonlite",
                      "gridGraphics", "PBSmapping", "date", "viridis",
                      "openair","cmocean", "terra",
                      "plotdap", "rerddapXtracto", "rgdal")
install.packages(list.of.packages, repos=repo)
