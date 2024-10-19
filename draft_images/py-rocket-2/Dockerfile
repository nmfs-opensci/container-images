FROM ghcr.io/nmfs-opensci/py-rocket-base:latest

USER root
# Add a Desktop application
RUN mkdir -p ${REPO_DIR}/mime/
COPY *.desktop ${REPO_DIR}/
COPY mime/*.xml ${REPO_DIR}/mime/

COPY environment.yml environment.yml
RUN mamba env update --name notebook -f environment.yml && mamba clean --all
RUN rm environment.yml

USER ${NB_USER}

