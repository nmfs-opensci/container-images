FROM jupyter/base-notebook:lab-2.2.9
#ENV JUPYTERHUB_SINGLEUSER_APP="jupyter_server.serverapp.ServerApp"

USER ${NB_UID}

RUN conda install --yes 'jupyterhub=2.0.0' && \
    conda clean --all -f -y

RUN conda install --yes -c esri 'arcgis=2.0.0' && \
    conda clean --all -f -y

#RUN conda install --yes jupyterlab-git jupytext && \
#    conda clean --all -f -y

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@2 && \
    jupyter labextension install arcgis-map-ipywidget@2.0.0

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

RUN mkdir /etc/jupyterhub
COPY jupyterhub_config.py /etc/jupyterhub/
RUN fix-permissions /etc/jupyterhub/

RUN fix-permissions /etc/jupyter/

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

WORKDIR $HOME