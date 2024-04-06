FROM jupyter/base-notebook:lab-2.2.9

#RUN conda install --yes 'jupyter-server-proxy=3.2.2' && \
#    conda clean --all -f -y
    
USER root

# Configure container startup
CMD ["abc.py"]

# Copy local files as late as possible to avoid cache busting
RUN rm /usr/local/bin/start-notebook.sh
# COPY start-notebook.sh /usr/local/bin/start-notebook.sh
COPY start-singleuser.py /usr/local/bin/start-singleuser.py
RUN rm /usr/local/bin/start-singleuser.sh

USER ${NB_USER}