#!/bin/bash

echo "Starting entrypoint.sh"

echo "Starting Jupyter Lab in background"
runuser rstudio -c "jupyter lab --ip=0.0.0.0 --port=80 --allow-root --no-browser --notebook-dir=/home/jovyan --NotebookApp.token='' --NotebookApp.password=''" &
echo "Blocking indefinitely"
runuser rstudio -c "sleep infinity"

echo "Exiting entrypoint.sh"