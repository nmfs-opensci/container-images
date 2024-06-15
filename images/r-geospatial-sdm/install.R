#! /usr/local/bin/Rscript
# install R dependencies

# A few more geospatial packages
install.packages(c("rstac", "aws.s3", "gdalcubes"))
install.packages(c("rnaturalearth", "rnaturalearthdata", "geodata", "ggspatial", "marmap"))
remotes::install_github('r-tmap/tmap', upgrade=FALSE)
remotes::install_github("boettiger-lab/earthdatalogin")

# CoastWatch required
list.of.packages <- c("parsedate", "reshape2", "gridGraphics", "PBSmapping",   
                      "date", "openair", "cmocean", "plotdap", "rerddapXtracto")
install.packages(list.of.packages)

# sdmTMB packages
install.packages("INLA", repos=c(getOption("repos"), INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)
install.packages("sdmTMB", dependencies = TRUE)
remotes::install_github("pbs-assess/sdmTMBextra", dependencies = TRUE)
list.of.packages <- c("fmesher", "assertthat", "inlabru")
install.packages(list.of.packages)

# packages for Python to R interoperability
install.packages(c("reticulate"))

# SDM general packages
install.packages(c("biomod2", "dismo", "usdm", "ecospat", "gam", "sdmpredictors", "robis", "zoon", "spocc"))
devtools::install_github("BigelowLab/maxnet")

# general
install.packages(c("gtools", "gdata", "quarto", "corrplot", "here", "matrixcalc", "cmocean", "DT", "janitor"))
