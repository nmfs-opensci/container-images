Solution involves:

* adding nb_conda_kernels module to the base env
* adding ipykernel module to each of the extra envs
* Registering the kernels in the Dockerfile with

```
USER root
RUN python -m ipykernel install --prefix /srv/conda/envs/env1 --name env1 --display-name env1
RUN python -m ipykernel install --prefix /srv/conda/envs/env2 --name env2 --display-name env2
USER ${NB_USER}
```