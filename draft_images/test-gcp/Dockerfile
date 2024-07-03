FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

# Merge in files from the assets directory
# https://source.corp.google.com/dev-con/workstation/base/Dockerfile
COPY ./assets/. /

# Set the entrypoint
ENTRYPOINT ["/google/scripts/entrypoint.sh"]