Some notes regarding working with the nmfs-opensci jupyter lab images in codespaces.

Many of these images include the RStudio server and jupyter-rsession-proxy. There are a number of oddies that occur when launching the RStudio server (via the button in JupyterLab)

* In RStudio, the PWD is changed to `/workspaces/<reponame>` in the terminal tab of RStudio. If the image is used as-is with `"image": ` in the devcontainer.json file, this does not happen. https://github.com/jupyterhub/jupyter-rsession-proxy/issues/145. This terminal is opened with `bash --login` so this tells it to use the right PWD `echo PWD=/home/jovyan\ncd $PWD >> ~/.bash_login`
* In the images, port 8888 is exposed. If `jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser` is used to start Jupyter Lab, then RStudio will not launch. There is some weird re-directing of the url. Instead use a different port. I use 8889

Other oddities.

* Rebuilding the devcontainer from a running devcontainer doesn't work because because the working directory is /home/jovyan and that does not have a devcontainer.json file.
* If a README.md file is in the working directory (set to /home/jovyan), then that is displayed automatically with preview. If a README.md file is created and opened with 
```
  "customizations": {
    "codespaces": {
      "openFiles": [ "README.md" ],
    },
    "vscode": {
      "settings": { 
        "workbench.editorAssociations": { "*.md": "vscode.markdown.preview.editor", },
      },
    }
  },
```
it will open in the editor not preview. My solution is to create a README.md in \home\jovyan after the container is started.

