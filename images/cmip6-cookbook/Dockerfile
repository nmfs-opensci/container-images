FROM pangeo/pangeo-notebook:2024.04.08

# set-up the base cmip6-cookbook environment
COPY environment.yml environment.yml
RUN mamba env create -n cmip6 -f environment.yml
RUN rm environment.yml

RUN conda deactivate \
  && conda activate cmip6 \
  && python -m ipykernel install --user --name cmip6 \
  && conda deactivate \
  && conda activate notebook

USER ${NB_USER}

