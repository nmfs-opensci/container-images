#!/bin/bash

echo "Starting entrypoint.sh"

echo "Starting Jupyter Lab in background"
jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser --notebook-dir=/home/jovyan --NotebookApp.token='' --NotebookApp.password='' &
#jupyter server --ServerApp.port=80 &

echo "Blocking indefinitely"
sleep infinity

echo "Exiting entrypoint.sh"