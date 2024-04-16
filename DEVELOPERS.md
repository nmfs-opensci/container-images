# NMFS Open Science Docker Stack -- for developers

These are a collection of container images to provide standardized environments for Python and R computing. See the wiki for discussion of the images. Want to contribute? Put in a pull request or if you are from NOAA Fisheries, reach out to Eli Holmes to be added to the repository.

How can I use container images? JupyterHubs, Codespaces, GitLab, Binder, VSCode on your laptop (need Docker or Podman installed). We are working on templates to show you how to use these in a Codespace to add a computational environment right to your Codespace without building it.

## Creating Dockerfiles

These are the main base images. They are variants of the Openscapes images. See `images/coastwatch` and `images/jupyter-base-notebook` for simple examples. Then see the next section on adding images.

* R verse `ghcr.io/nmfs-opensci/container-images/py-rocket-base:4.3.3-3.10`
* Python+R geospatial `ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial:4.3.3-3.10`
* Python geospatial `openscapes/python`

## To add images to the repository

* Create new dir in `images` directory for your image. Add the Dockerfile there.
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

## Run with Binder

Should work out of the box. Copy the Dockerfile into a repo and put the Dockerfile in the base or in a folder called `binder`. Then put this in a browser. Note many of the Docker images are big and somewhat hairy to build. This might not work in binder.

```
https://mybinder.org/v2/gh/user-name/reponame/main
```

## With Codespaces

Still working to streamline this.

## GitPod -- like Codespaces

Still working to streamline this.

## Run on Colab?

https://github.com/indigo-dc/udocker

Installation in the Jupyter notebook
```
%%shell
pip install udocker
udocker --allow-root install
udocker --allow-root run -p 127.0.0.1:8888:8888 -v -e ghcr.io/nmfs-opensci/container-images/openscapes-rocker:latest
```

Or this? https://stackoverflow.com/questions/62820498/how-to-connect-google-colab-with-localhost-running-docker-image

port forwarding https://biplobsd.me/blogs/view/run-swirl-open-source-search-engine-on-google-colab.md

## License information

All code is under open licenses. Some is copy-left which means if you modify their code (we don't), you need to also provide your source code. The Dockerfile code is released under Apache 2.0, a very permissive open source license which does not require that you make you own modifications open. See the README.md files for the licenses for specific code used in the Docker files.

* The Dockerfiles are released under Apache 2.0.
* [jupyterhub](https://github.com/jupyterhub/jupyterhub?tab=License-1-ov-file#readme) : Modified BSD License
* [juptyerlab](https://github.com/jupyterlab/jupyterlab?tab=License-1-ov-file#readme): Open license

* [Openscapes base Python image](https://github.com/nasa-openscapes/corn): MIT
* [Pangeo Docker Stack](https://github.com/pangeo-data/pangeo-docker-images): MIT
* [Python](https://docs.python.org/3/license.html): Zero clause BSD

* [Openscapes base rocker image](https://github.com/nasa-openscapes/py-rocket): MIT
* [Rocker Docker Stack](https://github.com/rocker-org/rocker-versioned2?tab=GPL-2.0-1-ov-file#readme): GPL-2
* [R](https://www.r-project.org/Licenses/): GPL-2, GPL-3
* RStudio Server: GPL-3




