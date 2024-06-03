Some notes regarding working with the nmfs-opensci jupyter lab images in codespaces.

Many of these images include the RStudio server and jupyter-rsession-proxy. There are a number of oddies that occur when launching the RStudio server (via the button in JupyterLab)

* When a Dockerfile and `"build":` or docker compose is used, the PWD is changed to `/workspaces/<reponame>` in the terminal tab of RStudio. If the image is used as-is with `"image": ` in the devcontainer.json file, this does not happen.
* In the images, port 8888 is exposed. If `jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser` is used to start Jupyter Lab, then RStudio will not launch. There is some weird re-directing of the url. Instead use