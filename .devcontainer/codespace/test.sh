#!/bin/bash

# Construct the message
message="{
  \"name\": $1,
  \"workspaceFolder\": \"/home/jovyan\",
  \"image\": \"ghcr.io/nmfs-opensci/container-images/\"$1\":latest\",
"