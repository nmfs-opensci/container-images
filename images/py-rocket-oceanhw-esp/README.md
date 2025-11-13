# README

## py-rocket-oceanhw-esp

Python-R image for OceanHackWeek-en-Español, https://intercoonecta.github.io. Based on customizations of the `py-rocket-geospatial-2` image.

### Emilio's notes on new Docker image

**I'll clean this up soon**

```bash

docker compose build py-rocket > build_no_custom_R.log 2>&1

docker compose build py-rocket > build_logs/build_custom-R-pckgs.log 2>&1

docker compose up py-rocket

# logs from docker compose up py-rocket are available via
docker compose logs py-rocket


# view and rm containers
docker ps -a
docker rm a68304072b28

# rename and remove images
docker rmi 0b148c9c27c9
docker tag a65b2f13b739 py-rocket-oceanhw-esp:r-custom-3
docker rmi py-rocket-oceanhw-esp:latest
```

### From py-rocket-geospatial v2.0 README

This creates a base Python-R image with geospatial packages for Python and R. The Python environment is the Pangeo notebook environment + extra geospatial libraries (similar to CryoCloud). The R environment is Rocker geospatial plus a few other packages. The image also includes a linux Desktop with QGIS, CoastWatch Utilities, and Panoply.

TeXLive and Quarto are installed along with MyST and JupyterBook.

Python 3.12 is installed with a conda environment called notebook that is activated on opening the container. R 4.4.X is installed.

See the documentation on [py-rocket-base](https://nmfs-opensci.github.io/py-rocket-base/) for information on the image structure and design.