FROM ghcr.io/nmfs-opensci/container-images/py-rocket-base:latest

USER root

ENTRYPOINT ["jupyter lab --ip=0.0.0.0 --port=80 --allow-root --no-browser --notebook-dir=/home/jovyan --NotebookApp.token='' --NotebookApp.password=''  --NotebookApp.allow_origin='*' & sleep infinity"]
