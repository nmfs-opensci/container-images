# NMFS Open Science Docker Stack -- for developers

These are a collection of container images to provide standardized environments for Python and R computing. See the wiki for discussion of the images. Want to contribute? Put in a pull request or if you are from NOAA Fisheries, reach out to Eli Holmes to be added to the repository.

How can I use container images? JupyterHubs, Codespaces, GitLab, Binder, VSCode on your laptop (need Docker or Podman installed). We are working on templates to show you how to use these in a Codespace to add a computational environment right to your Codespace without building it.

## Creating Dockerfiles

These are the main base images. They are variants of the Openscapes images. See `images/coastwatch` and `images/jupyter-base-notebook` for simple examples. Then see the next section on adding images.

* R verse `ghcr.io/nmfs-opensci/container-images/py-rocket-base:4.3.3-3.10`
* Python+R geospatial `ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial:4.3.3-3.10`
* Python geospatial `openscapes/python`

## To add images to the repository

* Create new dir in `draft_images` directory for your image. Add the draft Dockerfile there.
* Create new `build-docker-mynewimage.yml` file in `.github/workflows` folder and make necessary edits in the file. It'll be obvious.
* Push the changes and the docker image should build. Check the Actions tab to check progress and debug fails.
* Once the image builds, you'll see it listed under packages in the right nav bar.
* Create a lock-file for reproducibility
```
conda-lock -f environment.yml -p linux-64
```

## To run images in a JupyterHub with 'bring your image'

* Go to https://itcoocean.2i2c.cloud/
* Click on the 'Bring your own image' radio button at bottom
* Paste in url to your image (or any other image)
* You will find the urls in the right nav bar under 'Packages'
* Example `ghcr.io/nmfs-opensci/container-images/jupyter-base-notebook:latest`

## Run with a JupyterHub

Should work out of the box. Put the url to the image whereever you would use images.

## Run with docker

```
docker run -p 8888:8888 ghcr.io/nmfs-opensci/container-images/openscapes-rocker:latest
```

On a Mac M2+ with Rosetta emulation turned on in the Docker Desktop settings.
```
docker run --platform linux/amd64 -p 8888:8888 ghcr.io/nmfs-opensci/container-images/openscapes-rocker:latest
```

In the terminal look for something like and put that in a browser.
```
http://127.0.0.1:8888/lab?token=6d45c7d88aba92a815647c
```

## Creating the .devcontainer files

It is all in `.devcontainer/codespace`. You will run the `.make_devcontainers.sh` script. Instructions are in the script.

## Creating a .binder branch

Each image has to have its own branch since binder needs a repo. 

* Create branch
* Edit the file in the `.binder` directory to have the right docker image