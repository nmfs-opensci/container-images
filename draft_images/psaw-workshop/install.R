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

install.packages(c("quarto", "reticulate", "tidyverse",'gt','units','sf','terra','stars','rnaturalearth',), repos=repo)
