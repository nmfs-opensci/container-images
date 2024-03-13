# devcontainer-focused Rocker
FROM docker.io/aomlomics/tourmaline:latest

USER root
ENV NB_USER=jovyan \
    NB_UID=1000
ENV HOME=/home/${NB_USER}

RUN echo "Creating ${NB_USER} user..." \
    # Create a group for the user to be part of, with gid same as uid
    && groupadd --gid ${NB_UID} ${NB_USER}  \
    # Create non-root user, with given gid, uid and create $HOME
    && useradd --create-home --gid ${NB_UID} --no-log-init --uid ${NB_UID} ${NB_USER} \
    # Make sure that /srv is owned by non-root user, so we can install things there
    && chown -R ${NB_USER}:${NB_USER} /srv

# add the packages needed for jupyterhubs
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f jhub-environment.yml && conda clean --all

USER ${NB_USER} 
WORKDIR /home/${NB_USER}
