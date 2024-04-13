FROM pangeo/pangeo-notebook:2024.04.08
RUN conda init zsh && conda init bash

# set-up the base cmip6-cookbook environment
COPY environment.yml environment.yml
RUN mamba env create -n cmip6 -f environment.yml
RUN rm environment.yml

# Activate so I can use --user instead of knowing where the conda dir is
RUN conda activate cmip6 \
  && python -m ipykernel install --user --name cmip6 \
  && conda deactivate \
  && conda activate notebook

USER ${NB_USER}

