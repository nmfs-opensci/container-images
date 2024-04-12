FROM openscapes/python:6ee57a9

# install additional package...

USER ${NB_USER}

RUN mamba env update -c conda-forge -n notebook nb_conda_kernels

# set-up the base cmip6-cookbook environment
COPY environment.yml environment.yml
RUN mamba env create -f environment.yml
RUN rm environment.yml
