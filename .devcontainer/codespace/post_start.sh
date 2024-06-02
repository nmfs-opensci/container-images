#!/bin/bash

# Construct the message
message="# Welcome
This VS code container is the entry to your Jupyter Lab. Click green button to open.
  
[![Button]][Link]

- This Codespace is not connected to a repo. Make sure to clone a GitHub repo and push your changes.
You can also upload and download files.

[Button]: https://img.shields.io/badge/Open%20Jupyter%20Lab-37a779?style=for-the-badge

[Link]: https://$CODESPACE_NAME-8889.app.github.dev
"
echo "Debug: Constructed message."

echo "$message" > /home/jovyan/codespace/README.md

sleep 5

nohup jupyter lab --ip=0.0.0.0 --port=8889 --allow-root --no-browser --NotebookApp.token='' --NotebookApp.password='' >/dev/null 2>&1 &

echo rstudio | sudo -S apt-get update
sudo apt-get install -y xdg-utils

xdg-open https://$CODESPACE_NAME-8889.app.github.dev
