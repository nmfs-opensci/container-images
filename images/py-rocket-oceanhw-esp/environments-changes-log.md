# Log of changes to Python & R environments

## Python

2026-11-4. Removed or unpinned several packages in `environment.yml`. Also moved `xq` and `google-cloud-storage` from pip to conda installs

### Removed unnecessary (old) `>=` pinning

dask, earthaccess, gcsfs, geopandas, s3fs, xarray, 

### Removed `<` pinning, may need testing

zarr<3,

### Removed packages

```yml
# 2026-11-3: Don't need dev packages for OHW-es
- hypothesis # needed by numpy testing tools

- opt_einsum # Remove, conda package last updated 2024-09
# 2026-11-3: Remove, conda package last updated 2021-05
- pymannkendall # non-parametric Mann-Kendall trend analysis

# Machine Learning packages
- py-xgboost~=2.1.1=cpu* # Remove. Old, and not clear it's needed

- awscliv2 # Remove, conda package last updated 2024-09
- stackstac # Remove, conda package last updated 2024-08
- intake-stac==0.4.0 # 2025-11-19: intake-stac hasn't been meaninfully updated since 2022-05
- intake-xarray # Remove, conda package last updated 2024-12
- intake-esm  # Can add later if needed
- dask-labextension # dask-labextension is already installed in the pangeo-notebook package
- ecmwflibs # Can add later if needed. Wraps some of European Centre for Medium-Range Weather Forecasts libraries

- lonboard # Can add later if needed

- pip # pip is already present in the py-rocket-base environment

# 2026-11-3: Don't need these dev packages for OHW-es
- pytest
- pytest-cov
- pep8
- flake8

# 2026-11-3: Remove, conda package last updated 2024-12. But wasn't it used in a past ohw-es tutorial?
- eofs
- pyco2sys # Remove, conda package last updated 2024-12. Can add if needed
- xmip # Remove, conda package last updated 2024-01
```

## Other (not Python or R)

2026-11-05. Added opencode.ai terminal program. Updated Panoply to the latest version, and to be sourced from Emilio's website because the NASA GISS website continues to be unreliable
