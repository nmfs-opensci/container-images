FROM jupyter/base-notebook:lab-2.2.9

#RUN conda install --yes 'jupyter-server-proxy=3.2.2' && \
#    conda clean --all -f -y
    
# Configure container startup
CMD ["start-notebook.py"]

# Copy local files as late as possible to avoid cache busting
COPY start-notebook.py start-notebook.sh start-singleuser.py start-singleuser.sh /usr/local/bin/
