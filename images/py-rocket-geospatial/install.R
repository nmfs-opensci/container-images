#! /usr/local/bin/Rscript
# install R dependencies

install.packages(c("rstac", "quarto", "aws.s3", "reticulate", "gdalcubes", "rnaturalearth", "rnaturalearthdata"))
remotes::install_github('r-tmap/tmap', upgrade=FALSE)
devtools::install_github("boettiger-lab/earthdatalogin")

# CoastWatch required
list.of.packages <- c("parsedate", "reshape2", "gridGraphics", "PBSmapping",   
                      "date", "openair", "cmocean", "plotdap", "rerddapXtracto")
install.packages(list.of.packages)