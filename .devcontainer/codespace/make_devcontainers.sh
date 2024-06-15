#!/bin/bash

# chmod +x ./.devcontainer/codespace/make_devcontainers.sh
# ./.devcontainer/codespace/make_devcontainers.sh
a=$(Rscript -e 'cat(here::here())')
cd $a
chmod +x ./.devcontainer/codespace/devcontainer_template.sh
fils="$(ls ./images)"
for i in $fils
do
   echo $i
   mkdir ./.devcontainer/$i
   ./.devcontainer/codespace/devcontainer_template.sh $i
done