# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

from jupyter_core.paths import jupyter_data_dir
import subprocess
import os
import errno
import stat

c = get_config()  # noqa: F821
c.Spawner.cmd = ["jupyter-labhub"]
c.Spawner.default_url = '/lab/'
c.SingleUserNotebookApp.default_url = "/lab/"
c.NotebookApp.default_url = "/lab/"
