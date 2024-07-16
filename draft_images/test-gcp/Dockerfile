FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

# Merge in files from the assets directory
# https://source.corp.google.com/dev-con/workstation/base/Dockerfile
#USER root
COPY ./assets/. /

USER root

# Set the entrypoint
#ENTRYPOINT ["/google/scripts/entrypoint.sh"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=80", "--allow-root", "--no-browser --notebook-dir=/home/jovyan --NotebookApp.token='' --NotebookApp.password=''"]