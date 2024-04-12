FROM openscapes/python:4f340eb

# install nb_conda_kernels to allow conda kernels

USER ${NB_USER}

RUN conda install -c conda-forge -n notebook nb_conda_kernels
RUN conda install -c conda-forge -n notebook pillow cmocean
