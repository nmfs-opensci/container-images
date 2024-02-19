# Python 3.11
FROM quay.io/jupyter/base-notebook:2024-02-13

# Add git to the 
RUN apt-get -y update
RUN apt-get -y install git

# Add the packages you want to environment.yml
# Adds to the base env so you do not need to activate
COPY environment.yml environment.yml
RUN conda env update --name base -f environment.yml && conda clean --all

