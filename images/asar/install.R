#! /usr/local/bin/Rscript
# install R dependencies

# Check if the first library path is inside /home
install_lib <- .libPaths()[1]
if (grepl("^/home", install_lib)) {
  stop("Error: Packages are being installed to /home, which will be removed in the final image. Exiting.", call. = FALSE)
}

# to match rocker/verse:4.4 used in py-rocker-base
# look up the date that the Rocker image was created
repo <- "https://p3m.dev/cran/__linux__/jammy/2025-04-10"

# Extra packages
list.of.packages <- c("quarto", "here", "tinytex", "devtools")
install.packages(list.of.packages, repos=repo)

devtools::install_github("nmfs-ost/asar")
devtools::install_github("nmfs-ost/stockplotr")

