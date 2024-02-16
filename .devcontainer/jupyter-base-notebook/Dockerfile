FROM quay.io/jupyter/base-notebook:latest

# Add the packages you want to environment.yml
# Adds to the base env so you do not need to activate
COPY environment.yml environment.yml
RUN conda env update --name base -f environment.yml && conda clean --all

