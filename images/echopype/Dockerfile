# A pangeo base Python 3.10 image
FROM openscapes/python:4f340eb

# holoviews is out of date in the openscapes image
RUN mamba update -c conda-forge --name notebook holoviews
RUN mamba update -c conda-forge --name notebook hvplot

# The default conda env on the openscapes image is notebook
RUN mamba install -c conda-forge --name notebook cmocean
RUN mamba install -c conda-forge --name notebook echopype=0.8.1
