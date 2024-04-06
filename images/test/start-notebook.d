KubeSpawner.cmd = ['start-notebook.sh']
c.Spawner.cmd = ["jupyter-labhub"]
export JUPYTERHUB_SINGLEUSER_APP='jupyter_server.serverapp.ServerApp'
c.Spawner.default_url = '/lab/'
