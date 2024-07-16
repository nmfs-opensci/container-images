#!/bin/bash
# https://github.com/mchmarny/custom-cloud-workstation-image/tree/main

echo "Starting entrypoint.sh"

echo "Starting Jupyter Lab in background"
jupyter lab --ip=0.0.0.0 --port=80 --allow-root --no-browser --notebook-dir=/home/jovyan --NotebookApp.token='' --NotebookApp.password=''  --NotebookApp.allow_origin='*' &

#echo "Blocking indefinitely"
#sleep infinity

echo "Exiting entrypoint.sh"