# Intructions for using the images

There are many ways to use Docker images. Here are common ones. Scroll to the bottom for instructions on linking your container to file systems (so you can get and store files).

## To run images in a JupyterHub with 'bring your image'

If your JupyterHub has this option:

-   Click on the 'Bring your own image' radio button at bottom
-   Paste in url to your image (or any other image)
-   You will find the urls in the right nav bar under 'Packages'
-   Example `ghcr.io/nmfs-opensci/jupyter-base-notebook:latest`

## Run with a JupyterHub

Should work out of the box. Put the url to the image whereever you would use images.

## Run with docker

You can run the images on a Virtual Machine or your computer if you have Docker or Podman installed.

```         
docker run -p 8888:8888 ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest
```

On a Mac M2+ with Rosetta emulation turned on in the Docker Desktop settings.

```         
docker run --platform linux/amd64 -p 8888:8888 ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest
```

In the terminal look for something like and put that in a browser.

```         
http://127.0.0.1:8888/lab?token=6d45c7d88aba92a815647c
```

**Running geospatial R Docker images and working with netCDF files**

GDAL netCDF driver needs some extra flags added to the `docker run` for GDAL to work correctly when run inside a Docker container. This doesn't affect Python as much since `xarray` works with netCDF via different drivers, but the `terra` netCDF functions use GDAL drivers under the hood to open netCDF files. You'll get error saying it can't find files. We ran into trouble when accessing cloud-hosted netCDF files. Perhaps it works ok if you download the files.

Add this to the call:
```
--cap-add SYS_PTRACE --security-opt seccomp=unconfined
```
so you call will look like:
```
docker run -p 8888:8888 --cap-add SYS_PTRACE --security-opt seccomp=unconfined ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial:latest
```
Note we had trouble getting this to work on an Mac with Apple chips. You can test if it is going to work by running this Python code and seeing if `you can see if `DCAP_VIRTUALIO` is listed:
```
from osgeo import gdal
nc = gdal.GetDriverByName("netCDF")
nc.GetMetadata().keys()
```


## Run with Binder

Create a file called `Dockerfile` and put in the base of your GitHub repository or in a folder called `binder` or `.binder`. Into that file put the following line (replacing the image url to match your desired image).
```
FROM ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial:latest
```

Then go to <https://mybinder.org> and paste in the url to your GitHub repo or alternatively go to the following url directly:
```         
https://mybinder.org/v2/gh/<username or org>/<reponame>
```

## With Codespaces

See the folders in the `.devcontainer` folder and create a `.devcontainer/devcontainer.json` file in your own repo by copying one of `devcontainer.json` file. They all use the same template with just the top lines changed. Note that the folder `.devcontainer/codespace` is also required. If you change the line that starts up Jupyter Lab (at the bottom of the devcontainer.json file, do not use port 8888 or else RStudio will not launch. 

The Codespaces code is based on: <https://github.com/MichaelAkridge-NOAA/Open-Science-Codespaces>

## GitPod -- like Codespaces

Work in progress. Approach is similar to Codespaces.

## Run on Google Colab

TBD. This seems harder. See this [issue](https://github.com/nmfs-opensci/container-images/issues/14)

# Getting access to files

The container gives you a computing environment, but by design, it is a container and not connected to the file system in whatever is running the container. So you will need to get your files in/out of the container and have a way to save your work.

## Upload/Download files

Under the Files menu in Jupyter Lab or the Files tab in RStudio, you can upload and download files.

## Use a Git repository

Jupyter Lab and RStudio have Git GUIs. Use those or the command line to clone repos and push changes back to the repos.

```
cd ~
git clone <url to the repo>
```

## Connect to a bucket

If you are working with large data sets, you do not want to move these into your container (slow, slow). You will want to create a bucket (like an S3 bucket) and connect to that. This is like having a external drive in the cloud.

Instructions to come.

## Mount a file system

You can mount a local file system and read/write directly from that. Here "local" means the machine that is running the container. "local" might be a virtual machine, a server or your computer.

**On a JupyterHub**: The managers of the hub most likely have created persistent memory for you. If not, use Git, upload/download, or use buckets.

**On your computer**: you'll add a flag to the `docker run` command to mount your local file system to the Docker container.

When you use `--volume` to bind-mount a file or directory, make sure it does not exist on the Docker container. So do not bind a directory like `\usr` which would destroy the container (nothing bad; it just won't work). Use something like `\home\jovyan\mydir`. `--volume` creates the endpoint for you and it is always created as a directory.

In this example, `mydir` needs to exist in the directory where you are running `docker run`. If you get errors, try `ls` to make sure the directory is there.
```
docker run --platform linux/amd64 -p 8888:8888 --volume ./myproject_files:/home/jovyan/mydir ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest
```
as you work in `mydir` in the container, those changes will appear in your computer's `myproject_files` directory. It is as if you are working on your own computer, but you are using the development environment of the docker file.

Mac users with Apple chips, add `--platform linux/amd64`:
```
docker run --platform linux/amd64 -p 8888:8888 --volume ./myproject_files:/home/jovyan/mydir ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest
```

