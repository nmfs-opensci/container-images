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

install.packages(c("rstac", "quarto", "aws.s3", "reticulate", "gdalcubes", "rnaturalearth", "rnaturalearthdata"), repos=repo)

remotes::install_github('r-tmap/tmap', upgrade=FALSE)
# CRAN version is out of date
devtools::install_github("boettiger-lab/earthdatalogin")

# CoastWatch required
list.of.packages <- c("parsedate", "reshape2", "gridGraphics", "PBSmapping",   
                      "date", "cmocean", "plotdap", "rerddapXtracto")
install.packages(list.of.packages, repos=repo)


# -------  OceanHackWeek R image customizations ------- 

# TODO: Group into high-level (eg, sfnetworks, oce, robis) vs low-level and narrow (eg, akima, mda)
list.of.packages_ohw <- c(
    "plot.matrix", "isdparser", "geonames", "readHAC", 
    "greybox", "sfnetworks", "smooth", "oce", "ocedata",
    "akima", "ape", "biomod2", "caret", "caTools", "CircStats", "corrplot", "cowplot", 
    "dismo", "doParallel", "earth", "fields", "forecast", "ggspatial", "glmnet", "hexbin",
    "kableExtra", "latticeExtra", "lmtest", "mapplots", "marmap", "matrixStats", "mda", "metR", 
    "palmerpenguins", "plotly", "rasterVis", "robis", "rosm", "tseries", "tsibble", "udunits2", "urca", "vioplot"
)
install.packages(list.of.packages_ohw, repos=repo)

# TODO: Should they include upgrade=FALSE?
remotes::install_github("hvillalo/echogram")
remotes::install_github("hvillalo/periods")
remotes::install_github("hvillalo/satin")
remotes::install_github("hadley/emo")
remotes::install_github("JorGarMol/VoCC")
