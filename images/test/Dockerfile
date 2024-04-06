FROM jupyter/base-notebook:lab-2.2.9

#RUN conda install --yes 'jupyter-server-proxy=3.2.2' && \
#    conda clean --all -f -y
    
USER root

# Configure container startup
CMD ["start-notebook.py"]

# Copy local files as late as possible to avoid cache busting
COPY start-notebook.py  /usr/local/bin/start-notebook.py
COPY start-notebook.sh /usr/local/bin/start-notebook.sh
COPY start-singleuser.py /usr/local/bin/start-singleuser.py
COPY start-singleuser.sh /usr/local/bin/start-singleuser.sh

USER ${NB_USER}