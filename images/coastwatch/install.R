#! /usr/local/bin/Rscript
# install R dependencies

list.of.packages <- c("ncdf4", "httr","plyr","lubridate", "parsedate", "rerddap","plotdap",
                      "rerddapXtracto", "maps", "mapdata","RColorBrewer",
                      "ggplot2","scales","dplyr","Rcurl","raster","colorRamps",
                      "parsedate","sp","sf","reshape2","jsonlite",
                      "gridGraphics","PBSmapping","date","viridis",
                      "openair","cmocean", "terra")
install.packages(list.of.packages)