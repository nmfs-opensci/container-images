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

# From OceanHackWeek R image
# TODO: Group into high-level (eg, sfnetworks, oce, robis) vs low-level and narrow (eg, akima, mda)
list.of.packages_ohw <- c(
    "plot.matrix", "isdparser", "geonames", "readHAC", "noaa",
    "greybox", "sfnetworks", "smooth", "oce", "ocedata",
    "akima", "ape", "biomod2", "caret", "caTools", "CircStats", "corrplot", "cowplot", 
    "dismo", "doParallel", "earth", "fields", "forecast", "ggspatial", "glmnet", "hexbin",
    "kableExtra", "latticeExtra", "lmtest", "mapplots", "marmap", "matrixStats", "mda", "metR", 
    "palmerpenguins", "plotly", "rastervis", "robis", "rosm", "tseries", "tsibble", "udunits2", "urca", "vioplot"
)
install.packages(list.of.packages_ohw, repos=repo)

# TODO: Should newer packages be installed *without* "repos=repo"? Or with a newer repo version?

# TODO: Looks like "r-rnoaa" referred to the "noaa" package, https://cran.r-project.org/package=noaa
# But "noaa" didn't install (11/9)  either, even though it's actively maintained (vers 1.0, 2025-05-14)
# Could it be that it's just not in "repo"?

# TODO: rastervis was not installed (11/9)
# It was last updated on 2025-09-01

# TODO: rgdal was not installed (11/9)
# Should we install "gdalraster"?


# Should they include upgrade=FALSE?
remotes::install_github("hvillalo/echogram")
remotes::install_github("hvillalo/periods")
remotes::install_github("hvillalo/satin")
remotes::install_github("hadley/emo")
remotes::install_github("JorGarMol/VoCC")
