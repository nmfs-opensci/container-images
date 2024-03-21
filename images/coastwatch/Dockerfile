FROM openscapes/rocker:a7596b5

# Make sure R uses the conda path
RUN echo "PATH=${PATH}" >>"${R_HOME}/etc/Renviron.site"

# install into the coastwatch packages if missing environment
COPY install.R install.R
RUN Rscript install.R && rm install.R

# set-up the base coastwatch environment
# make sure we install in the notebook environment which is default in the
# Openscapes image
COPY coastwatch-environment.yml coastwatch-environment.yml
RUN mamba --name notebook -f coastwatch-environment.yml && mamba clean --all
RUN rm coastwatch-environment.yml
