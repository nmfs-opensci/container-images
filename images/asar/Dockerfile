FROM ghcr.io/nmfs-opensci/py-rocket-base:2025.04.26

LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.source=ghcr.io/nmfs-opensci/py-rocket-base
LABEL org.opencontainers.image.description="asar: run asar stock assessment reports."
LABEL org.opencontainers.image.licenses=Apache2.0
LABEL org.opencontainers.image.version=2025.05.23

ARG GITHUB_PAT
ENV GITHUB_PAT=${GITHUB_PAT}

USER root
COPY . /tmp2/
RUN /pyrocket_scripts/install-r-packages.sh /tmp2/install.R || (echo "ERROR: install-r-packages.sh failed" && exit 1)
RUN rm -rf /tmp2

RUN echo '{ "ServerApp": { "default_url": "/rstudio" } }' \
    > ${NB_PYTHON_PREFIX}/etc/jupyter/jupyter_server_config.d/default_url.json && \
    echo '{ "NotebookApp": { "default_url": "/rstudio" } }' \
    > ${NB_PYTHON_PREFIX}/etc/jupyter/jupyter_notebook_config.d/default_url.json
    
# Set up TeX Live repo and install required packages
USER root

# Install extra TeX Live packages not included by default
# Ensure tlmgr uses system mode and full path is available
RUN unset TEXMFHOME && \
    PATH=/usr/local/texlive/bin/linux:$PATH && \
    echo "Installing texlive collections and extra packages..." && \
    tlmgr install collection-latexrecommended collection-latexextra && \
    tlmgr install \
        pdfcol \
        tcolorbox \
        eurosym \
        upquote \
        adjustbox \
        titling \
        enumitem \
        ulem \
        soul \
        rsfs \
        lualatex-math \
        hyphenat \
        pdfcomment \
        luatex85 \
        tracklang \
        zref \
        wallpaper \
        multirow \
        wrapfig \
        draftwatermark \
        luatexbase \
        selnolig \
        lastpage \
        tagpdf \
        luamml

# Install DejaVu Sans Font       
RUN apt-get update && \
    apt-get install -y fonts-dejavu-core && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Arial Font; no Ariel Narrow since that is proprietary       
RUN apt-get update && \
    apt-get install -y ttf-mscorefonts-installer fontconfig && \
    fc-cache -f -v && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    
USER ${NB_USER}
ENV JUPYTERHUB_DEFAULT_URL=/rstudio
CMD ["jupyter", "server", "--ServerApp.default_url=/rstudio"]
WORKDIR ${HOME}
