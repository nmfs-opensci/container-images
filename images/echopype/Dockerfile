# A pangeo base Python 3.10 image
FROM openscapes/python:4f340eb

# The default conda env on the openscapes image is notebook
RUN mamba install -c conda-forge --name notebook cmocean
RUN mamba install -c conda-forge --name notebook echopype=0.8.1
