FROM openscapes/python:f577786

# install nb_conda_kernels to allow conda kernels

USER ${NB_USER}

RUN conda install -c conda-forge nb_conda_kernels
RUN conda install -c conda-forge pillow cmocean
