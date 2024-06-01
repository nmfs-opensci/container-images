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

# Start Jupyter Lab on port 8889
jupyter lab --ip=0.0.0.0 --port=8889 --allow-root --no-browser --NotebookApp.token='' --NotebookApp.password=''

sleep 10
