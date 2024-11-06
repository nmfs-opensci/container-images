#! /usr/local/bin/Rscript
# install R dependencies

# to match rocker/verse:4.4 used in py-rocker-base
# look up the date that the Rocker image was created and put that
repo <- "https://p3m.dev/cran/__linux__/jammy/2024-05-13"

install.packages(c("rstac", "quarto", "aws.s3", "reticulate", "gdalcubes", "rnaturalearth"), repos=repo)
install.packages("rnaturalearthdata", repos=repo)

remotes::install_github('r-tmap/tmap', upgrade=FALSE)
# CRAN version is out of date
devtools::install_github("boettiger-lab/earthdatalogin")

# CoastWatch required
list.of.packages <- c("parsedate", "reshape2", "gridGraphics", "PBSmapping",   
                      "date", "openair", "cmocean", "plotdap", "rerddapXtracto")
install.packages(list.of.packages, repos=repo)
