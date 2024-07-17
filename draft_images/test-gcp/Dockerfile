FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

# Merge in files from the assets directory
# https://source.corp.google.com/dev-con/workstation/base/Dockerfile
#USER root
COPY ./assets/. /

USER root

# Set the entrypoint
ENTRYPOINT ["/google/scripts/entrypoint.sh"]

EXPOSE 80/tcp
EXPOSE 8787/tcp