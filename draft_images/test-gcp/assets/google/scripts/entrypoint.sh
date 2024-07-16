#!/bin/bash
# https://github.com/mchmarny/custom-cloud-workstation-image/tree/main

echo "Starting entrypoint.sh"

echo "Starting Jupyter Lab in background"
runuser rstudio -c "jupyter lab --ip=0.0.0.0 --port=80 --allow-root --no-browser --notebook-dir=/home/jovyan --NotebookApp.token='' --NotebookApp.password=''" &

#echo "Blocking indefinitely"
#sleep infinity

echo "Exiting entrypoint.sh"