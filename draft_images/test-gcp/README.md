# Instructions

## Setting up gcloud on your computer

The Cloud Shell crashes constantly so this is the way to go.

These are Mac instructions

* `curl https://sdk.cloud.google.com | bash`
* Accept everything
* Close terminal and restart terminal
* `gcloud init` and accept everything.
* `gcloud auth login` to authenticate. Now you should be able to run commands below.

## Create image in Artifact Registry that is already hosted elsewhere

* Get to the Artifact Registry by select project and then search for 'Artifact Registry'. Create repo (if needed), click on that repo to enter.
* Get into cloud shell by clicking the `>_` like icon in top nav bar
* Set up variable names
```
$IMAGE_URL="ghcr.io/nmfs-opensci/container-images/test-gcp"
$IMAGE_NAME="test-gcp"
$IMAGE_TAG="latest"
$ARTIFACT_REGISTRY_REPONAME="nmfs-opensci-images"
$GCP_PROJECT_NAME="ggn-nmfs-opensciws-dev-1"
$ARTIFACT_REGISTRY_LOCATION="us-east4-docker.pkg.dev"
```
* pull in the image. You need to have docker running.
```
docker pull ghcr.io/nmfs-opensci/container-images/test-gcp:latest
```

* Tag the image with Artifact Registry info
```
docker tag ghcr.io/nmfs-opensci/container-images/test-gcp us-east4-docker.pkg.dev/ggn-nmfs-opensciws-dev-1/nmfs-opensci-images/test-gcp:latest
```
* Push in the image
```
$IMAGE_NAME="test-gcp"
$IMAGE_TAG="latest"
$ARTIFACT_REGISTRY_REPONAME="nmfs-opensci-images"
docker push us-east4-docker.pkg.dev/ggn-nmfs-opensciws-dev-1/$ARTIFACT_REGISTRY_REPONAME/$IMAGE_NAME:$IMAGE_TAG
```


