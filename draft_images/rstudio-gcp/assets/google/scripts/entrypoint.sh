#!/bin/bash
# https://github.com/mchmarny/custom-cloud-workstation-image/tree/main

echo "Starting entrypoint.sh"

echo "Starting RStudio in background"
usr/lib/rstudio-server/bin/rserver --www-port=80  --server-daemonize=0 &

echo "Blocking indefinitely"
sleep infinity

echo "Exiting entrypoint.sh"