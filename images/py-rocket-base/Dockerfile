# geospatial rocker with RStudio
# Is designed to have a conda environment called notebook like
# the pangeo images. The jupyterhub modules are in this environment.
#FROM ghcr.io/rocker-org/devcontainer/geospatial:4.3
FROM rocker/binder:4.3.3

USER root

# some Git preferences
RUN git config --system pull.rebase false && \
    git config --system credential.helper 'cache --timeout=36000'
    
# codeserver; VSCode
RUN curl -fsSL https://code-server.dev/install.sh | sh

# set environment variables
ENV CONDA_ENV=notebook \
    DEBIAN_FRONTEND=noninteractive \
    NB_USER=rstudio \
    SHELL=/bin/bash \
    # Setup locale to be UTF-8, avoiding gnarly hard to debug encoding errors
    LANG=C.UTF-8  \
    LC_ALL=C.UTF-8 \
    CONDA_DIR=/srv/conda

# All env vars that reference other env vars need to be in their own ENV block
# Path to the python environment where the jupyter notebook packages are installed
ENV NB_PYTHON_PREFIX=${CONDA_DIR}/envs/${CONDA_ENV} \
    # Home directory of our non-root user
    HOME=/home/${NB_USER}

# Add both our notebook env as well as default conda installation to $PATH
# Thus, when we start a `python` process (for kernels, or notebooks, etc),
# it loads the python in the notebook conda environment, as that comes
# first here.
ENV PATH=${NB_PYTHON_PREFIX}/bin:${CONDA_DIR}/bin:${PATH}

# Ask dask to read config from ${CONDA_DIR}/etc rather than
# the default of /etc, since the non-root jovyan user can write
# to ${CONDA_DIR}/etc but not to /etc
ENV DASK_ROOT_CONFIG=${CONDA_DIR}/etc

## Ensure that RStudio uses the conda notebook env for Python and modules
RUN echo "PATH=${PATH}" >>"${R_HOME}/etc/Renviron.site"

## Change the home directory to /home/jovyan for the rstudio user
## So that /home/jovyan is consistently the user directory in JupyterHubs
RUN usermod -aG sudo ${NB_USER} && chown -R ${NB_USER}:${NB_USER} /srv
RUN usermod -d /home/jovyan rstudio

## Ensure that users have a personal user library for R packages
RUN R -e 'if(!dir.exists(Sys.getenv("R_LIBS_USER"))) dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)'

# add bin to PATH earlier ($NB_PYTHON_PREFIX/bin)
RUN echo ". ${CONDA_DIR}/etc/profile.d/conda.sh ; conda activate ${CONDA_ENV}" > /etc/profile.d/init_conda.sh

## Add so that we can run the image as a devcontainer
# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
# https://jupyter-server.readthedocs.io/en/latest/operators/public-server.html#docker-cmd
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

USER ${NB_USER}

COPY --chown=rstudio:rstudio . /tmp/build

WORKDIR /tmp/build

# Install latest mambaforge in ${CONDA_DIR}
RUN echo "Installing Mambaforge..." \
    && URL="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh" \
    && wget --quiet ${URL} -O installer.sh \
    && /bin/bash installer.sh -u -b -p ${CONDA_DIR} \
    && rm installer.sh \
    && mamba clean -afy \
    # After installing the packages, we cleanup some unnecessary files
    # to try reduce image size - see https://jcristharif.com/conda-docker-tips.html
    && find ${CONDA_DIR} -follow -type f -name '*.a' -delete \
    && find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete

## Install environment that we need for JupyterHub into notebook
## Need environment.yml or conda-lock with JupyterHub modules for
## the image to work in a JupyterHub
RUN echo "Checking for 'conda-linux-64.lock' or 'environment.yml'..." \
        ; if test -f "conda-linux-64.lock" ; then \
        mamba create --name ${CONDA_ENV} --file conda-linux-64.lock \
        ; elif test -f "environment.yml" ; then \
        mamba env create --name ${CONDA_ENV} -f environment.yml  \
        ; fi \
        && mamba clean -yaf \
        && find ${CONDA_DIR} -follow -type f -name '*.a' -delete \
        && find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete \
        && find ${CONDA_DIR} -follow -type f -name '*.js.map' -delete

WORKDIR ${HOME}

EXPOSE 8888
CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0"]