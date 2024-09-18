FROM openscapes/python:39dffde
LABEL org.opencontainers.image.maintainers="eli.holmes@noaa.gov"
LABEL org.opencontainers.image.author="luiz.lopez@nasa.gov"
LABEL org.opencontainers.image.source=https://github.com/NASA-Openscapes/corn/tree/main/ci
LABEL org.opencontainers.image.description="NASA Openscapes Python image used in workshops"
LABEL org.opencontainers.image.licenses=Apache2.0

USER ${NB_USER}

# set-up the base coastwatch environment
# make sure we install in the notebook environment which is default in the
# Openscapes image
COPY coastwatch-environment.yml coastwatch-environment.yml
RUN mamba env update --name notebook -f coastwatch-environment.yml && mamba clean --all
RUN rm coastwatch-environment.yml

ENV CW_UTILS=https://www.star.nesdis.noaa.gov/socd/coastwatch/cwf/cwutils-4_0_0_198-linux-x86_64.tar.gz

WORKDIR /srv

RUN wget -O /tmp/cw_utils.tar.gz ${CW_UTILS}
RUN tar -zxf /tmp/cw_utils.tar.gz
RUN rm -rf /tmp/cw_utils.tar.gz
RUN apt-get clean

ENV PATH=${PATH}:/srv/cwutils/bin
ENV MANPATH=${MANPATH}:/srv/cwutils/doc/man
ENV INSTALL4J ADD VM PARAMS=-Dsun.java2d.uiScale=2.0

WORKDIR ${HOME}
