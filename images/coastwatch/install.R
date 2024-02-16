#! /usr/local/bin/Rscript
# install R dependencies

list.of.packages <- c("ncdf4", "httr","plyr","lubridate", "parsedate", "rerddap","plotdap",
                      "rerddapXtracto", "graphics", "maps", "mapdata","RColorBrewer",
                      "ggplot2","scales","dplyr","utils","Rcurl","raster","colorRamps",
                      "parsedate","sp","sf","reshape2","jsonlite","rgdal",
                      "gridGraphics","grid","PBSmapping","date","viridis",
                      "openair","cmocean")
install.packages(list.of.packages)