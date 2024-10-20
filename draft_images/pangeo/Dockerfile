FROM pangeo/pangeo-notebook:latest

USER root

ENV REPO_DIR="/srv/repo"
RUN mkdir -p ${REPO_DIR}
COPY . ${REPO_DIR}

# Install R, RStudio via Rocker scripts
ENV R_VERSION="4.4.1"
ENV R_DOCKERFILE="verse_${R_VERSION}"
RUN PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin && \
  chmod +x ${REPO_DIR}/rocker.sh && \
  ${REPO_DIR}/rocker.sh
# Missing some basic tex packages
RUN tlmgr install collection-latexrecommended && tlmgr clean --all

# Install extra cmd line packages after R installation
# The package_list part is reading the file and doing clean-up to just have the list of packages
RUN package_list=$(grep -v '^\s*#' ${REPO_DIR}/apt.txt | grep -v '^\s*$' | sed 's/\r//g; s/#.*//; s/^[[:space:]]*//; s/[[:space:]]*$//' | awk '{$1=$1};1') && \
  apt-get update && \
  apt-get install --yes --no-install-recommends $package_list && \
  apt-get autoremove --purge && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY environment.yml environment.yml
RUN mamba env update --name notebook -f environment.yml && mamba clean --all
RUN rm environment.yml

# Revert to default user
USER ${NB_USER}

