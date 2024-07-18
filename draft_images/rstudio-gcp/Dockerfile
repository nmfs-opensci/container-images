FROM rocker/rstudio

USER root

ENTRYPOINT ["/usr/lib/rstudio-server/bin/rserver --www-port=80 --server-daemonize=0 & sleep infinity"]
