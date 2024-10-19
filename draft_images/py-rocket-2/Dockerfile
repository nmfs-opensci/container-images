FROM ghcr.io/nmfs-opensci/py-rocket-base:latest

USER root
# Add a Desktop application
RUN mkdir -p ${REPO_DIR}/mime/
COPY *.desktop ${REPO_DIR}/
COPY mime/*.xml ${REPO_DIR}/mime/

COPY environment.yml environment.yml
RUN mamba env update --name notebook -f environment.yml && mamba clean --all
RUN rm environment.yml

# Install extra cmd line packages 
# The package_list part is reading the file and doing clean-up to just have the list of packages
COPY apt.txt apt.txt
RUN package_list=$(grep -v '^\s*#' apt.txt | grep -v '^\s*$' | sed 's/\r//g; s/#.*//; s/^[[:space:]]*//; s/[[:space:]]*$//' | awk '{$1=$1};1') && \
  apt-get update && \
  apt-get install --yes --no-install-recommends $package_list && \
  apt-get autoremove --purge && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
RUN rm apt.txt

USER ${NB_USER}

