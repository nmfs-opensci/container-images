#!/bin/bash

echo "Starting entrypoint.sh"

echo "Starting Jupyter Lab in background"
runuser jovyan -c "jupyter lab --ip=0.0.0.0 --port=80 --allow-root --no-browser --notebook-dir=/home/jovyan --NotebookApp.token='' --NotebookApp.password=''" &
echo "Blocking indefinitely"
runuser jovyan -c "sleep infinity"

echo "Exiting entrypoint.sh"