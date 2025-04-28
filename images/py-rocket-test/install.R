#! /usr/local/bin/Rscript
# install R dependencies

# to match rocker/verse:4.4 used in py-rocker-base
# look up the CRAN env set in the Dockerfile used
repo <- "https://p3m.dev/cran/__linux__/jammy/2025-04-10"

# Check if the first library path is inside /home
install_lib <- .libPaths()[1]
if (grepl("^/home", install_lib)) {
  stop("Error: Packages are being installed to /home, which will be removed in the final image. Exiting.", call. = FALSE)
}

install.packages(c("rstac", "quarto", "aws.s3", "reticulate", "gdalcubes", "rnaturalearth"), repos=repo)
install.packages("rnaturalearthdata", repos=repo)

remotes::install_github('r-tmap/tmap', upgrade=FALSE)
# CRAN version is out of date
devtools::install_github("boettiger-lab/earthdatalogin")

# CoastWatch required
list.of.packages <- c("parsedate", "reshape2", "gridGraphics", "PBSmapping",   
                      "date", "openair", "cmocean", "plotdap", "rerddapXtracto")
install.packages(list.of.packages, repos=repo)
