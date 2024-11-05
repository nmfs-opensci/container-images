#! /usr/local/bin/Rscript
# install R dependencies

# to match rocker/verse:4.4 used in py-rocker-base
# look up the date that the Rocker image was created and put that
repo <- "https://p3m.dev/cran/__linux__/jammy/2024-05-13"
list.of.packages <- c("plyr", "lubridate", "parsedate")
install.packages(list.of.packages, repos=repo)
