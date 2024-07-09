# Instructions

## July 6th

*Scroll down for instructions for setting up workstations*

Still not working on Google Workstation, but gets to the JupyterLab page. From there however nothing works not even Terminal.  Also the user of the Docker image must be root and `jupyter lab` in the EntryPoint needs to be run as root. It is possible that this is causing a problem. But when I use 
```
runuser rstudio -c "jupyter lab ..." &
```
The jupyter lab does not successfully launch. It says cannot connect to backend.

Gets to the Jupyter Lab

* test-v12 `jupyter lab` launched with root
* config-ly4sa1ub (test-ssh)  `jupyter lab` launched with root

Does not get to the Jupyter Lab

* test-v13 `runuser rstudio -c "jupyter lab"`

Problem might be the firewall rules? https://cloud.google.com/workstations/docs/configure-firewall-rules

https://medium.com/analytics-vidhya/setting-up-jupyter-lab-instance-on-google-cloud-platform-3a7acaa732b7
```
gcloud compute firewall-rules create JHUB \
    --action=ALLOW \
    --direction=INGRESS \
    --network=NETWORK \
    --rules=tcp\
    --source-tags=cloud-workstations-instance \
    --destination-ranges=CONTROL_PLANE_IP
```

## Setting up gcloud on your computer

The Cloud Shell crashes constantly so this is the way to go.

These are Mac instructions

* Start a terminal
* Run `curl https://sdk.cloud.google.com | bash`
* Accept everything
* Close terminal and restart terminal
* `gcloud init` and accept everything.
* `gcloud auth login` to authenticate. Now you should be able to run commands below. Run `gcloud auth login` if not.

## Create image in Artifact Registry that is already hosted elsewhere

*You can build and push directly to Artifact Registry but I have a build pipeline in GitHub already*

* Make sure you have permissions to create in Artifact Registry
* Get to the Artifact Registry by selecting project (top right) and then search for 'Artifact Registry'.
* Create repo (if needed), click on that repo to enter.
* Get into cloud shell by clicking the `>_` like icon in top nav bar or from your terminal on your own computer (much better since cloud shell crashes a lot).
* Set up variable names. For example:
```
IMAGE_URL="ghcr.io/nmfs-opensci/container-images/"
IMAGE_NAME="test-gcp"
IMAGE_TAG="v1.0.9"
ARTIFACT_REGISTRY_REPONAME="nmfs-opensci-images"
GCP_PROJECT_NAME="abc-abc"
ARTIFACT_REGISTRY_LOCATION="us-east4-docker.pkg.dev"
```
* Pull in the image. You need to have docker running.
```
docker pull $IMAGE_URL/$IMAGE_NAME:$IMAGE_TAG
```
* Tag the image with Artifact Registry info
```
docker tag $IMAGE_URL/$IMAGE_NAME:$IMAGE_TAG $ARTIFACT_REGISTRY_LOCATION/$GCP_PROJECT_NAME/$ARTIFACT_REGISTRY_REPONAME/$IMAGE_NAME:$IMAGE_TAG
```
* Push the image to Artifact Registry
```
docker push $ARTIFACT_REGISTRY_LOCATION/$GCP_PROJECT_NAME/$ARTIFACT_REGISTRY_REPONAME/$IMAGE_NAME:$IMAGE_TAG
```

## Creating a Workstation

### Create a cluster

### Create a workstation configuration

### Create a workstation

## Debugging

*Technically I think ssh-ing into the VM should work, but it gets me nowhere. No info whatsoever as if nothing is running on the VM.*

* Go to VM Instances
* Click on yours
* Look at logs

## Opening an app running on different port

* Click on dropdown instead of Launch on workstation page. It is hidden right next to Launch button.


