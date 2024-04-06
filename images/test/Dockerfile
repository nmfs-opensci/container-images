FROM jupyter/base-notebook:lab-2.2.9
ENV JUPYTERHUB_SINGLEUSER_APP=jupyter-server
Spawner.cmd = ["jupyter-labhub"]
USER ${NB_UID}

# I have to use this old base-notebook image (trust me), but it has a
# start-notebook.py that doesn't include "lab"
    
# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["start-notebook.sh"]

# Copy local files as late as possible to avoid cache busting
COPY start.sh start-notebook.sh start-singleuser.sh /usr/local/bin/
# Currently need to have both jupyter_notebook_config and jupyter_server_config to support classic and lab
COPY jupyter_notebook_config.py jupyter_server_config.py /etc/jupyter/
COPY start-notebook.d /usr/local/bin/start-notebook.d

# Fix permissions on /etc/jupyter as root
USER root

RUN fix-permissions /etc/jupyter/

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

WORKDIR $HOME