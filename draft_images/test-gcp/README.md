# Instructions

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
* pull in the image
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
