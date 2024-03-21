#! /usr/local/bin/Rscript
# install R dependencies

list.of.packages <- c("ncdf4", "httr","plyr","lubridate", "parsedate", "rerddap",
                      "graphics", "maps", "mapdata","RColorBrewer",
                      "ggplot2","scales","dplyr","utils","Rcurl","raster","colorRamps",
                      "parsedate","sp","sf","reshape2","jsonlite","rgdal",
                      "gridGraphics","grid","PBSmapping","date","viridis",
                      "openair","cmocean", "terra")
install.packages(list.of.packages)

# https://rmendels.r-universe.dev/rerddapXtracto   
install.packages('rerddapXtracto', repos = c('https://rmendels.r-universe.dev', 'https://cloud.r-project.org'))

# https://rmendels.r-universe.dev/plotdap  
install.packages('plotdap', repos = c('https://rmendels.r-universe.dev', 'https://cloud.r-project.org'))
