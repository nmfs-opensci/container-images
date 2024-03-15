FROM docker.io/aomlomics/tourmaline:latest

ENV NB_USER=qiime2 \
    NB_UID=1000 \
    CONDA_DIR=/opt/conda
ENV HOME=/home/${NB_USER}

USER ${NB_USER} 

# add the packages needed for jupyterhubs to the base environment
COPY jhub-environment.yml jhub-environment.yml
RUN conda env update --name base -f jhub-environment.yml && conda clean --all

# add packages needed for extra kernels in the notebooks
RUN conda install --name snakemake ipykernel && conda clean --all
RUN conda install --name qiime2-2023.5 ipykernel && conda clean --all

# Register the kernels so you can open in notebooks
RUN python -m ipykernel install --prefix ${CONDA_DIR}/envs/snakemake --name snakemake --display-name snakemake
RUN python -m ipykernel install --prefix ${CONDA_DIR}/envs/qiime2-2023.5 --name qiime2-2023.5 --display-name qiime2

WORKDIR /home/${NB_USER}
