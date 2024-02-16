# container-images

## To add images

* Create new dir in `images` directory for your image . Add Dockerfile there.
* Create new build-docker.yml in `.github/workflows` folder
* Push some changes and should rebuild

See `images/jupyter-base-notebook` for a simple example using a `environment.yml` file

## To run images

* Go to https://itcoocean.2i2c.cloud/
* Click on the 'Bring your own image' radio button at bottom
* Paste in url to your image (or any other image)
* You will find the urls in the right nav bar under 'Packages'
* Example `ghcr.io/nmfs-opensci/container-images/jupyter-base-notebook:latest`

