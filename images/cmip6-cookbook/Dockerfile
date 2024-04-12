FROM openscapes/python:6ee57a9

# install additional package...

USER root

#RUN mamba install -c conda-forge -n notebook nb_conda_kernels

# set-up the base cmip6-cookbook environment
COPY environment.yml environment.yml
RUN mamba env update -n notebook -f environment.yml
RUN rm environment.yml

USER ${NB_USER}

