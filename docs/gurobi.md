# Gurobi

Install Gurobi for Python in a dedicated Conda environment in your own account. Administrator privileges are not needed. We recommend a personal Academic Web License Service (WLS) license and a [JupyterHub terminal](jupyterhub.md) for persistent interactive sessions.

If you do not have Conda installed, first follow [Installing Miniforge](conda.md#installing-miniforge). Then return here to create your Gurobi environment.

## Install Gurobi

```bash
# Use only Gurobi's official channel and conda-forge for dependencies.
conda create -n gurobi --override-channels -c gurobi -c conda-forge python=3.11 gurobi
conda activate gurobi
```

The environment contains the Python interface (`gurobipy`), command-line solver, and license tools such as `grbgetkey`. See [Gurobi's installation guide](https://support.gurobi.com/hc/en-us/articles/360044290292-How-do-I-install-Gurobi-for-Python) for supported Python versions and other installation methods.

## Set up an Academic WLS license

We recommend **Academic WLS**, which works across compute nodes and in containers. Each user obtains and manages their own license. Alderaan compute nodes have internet access, as required to contact Gurobi's licensing service during optimization.

1. Register for a Gurobi academic account and request an Academic WLS license using [Gurobi's academic license instructions](https://support.gurobi.com/hc/en-us/articles/360040541251-How-do-I-obtain-a-free-academic-license). License creation and renewal require a recognized university network connection.
2. Follow the [WLS setup instructions](https://support.gurobi.com/hc/en-us/articles/13232844297489-How-do-I-set-up-a-Web-License-Service-WLS-license) to download your personal `gurobi.lic` file.
3. Save it in your Alderaan home directory as described below.

The standard Academic WLS license allows two concurrent Gurobi sessions and is valid for 90 days, with extensions while you remain eligible. It is for your own academic research, teaching, or coursework; do not share its credentials. See [Gurobi's WLS requirements](https://support.gurobi.com/hc/en-us/articles/34672988479633-What-are-the-restrictions-on-using-an-academic-WLS-license), and direct licensing questions or requests for additional sessions to Gurobi support.

A named-user academic license is an alternative for work on one fixed machine: it lasts up to a year and allows parallel jobs without WLS's default two-session limit, but is tied to that machine and does not support containers. See [Gurobi's license comparison](https://support.gurobi.com/hc/en-us/articles/360040541251-How-do-I-obtain-a-free-academic-license).

Save the license file as `$HOME/gurobi.lic`. Gurobi searches this location automatically. Keep the file private, especially when it contains WLS credentials:

```bash
# Allow only your account to read or write the license file.
chmod 600 "$HOME/gurobi.lic"
```

For an alternative location, set `GRB_LICENSE_FILE` to the full path to the file, including its filename. See [Gurobi's license file locations](https://support.gurobi.com/hc/en-us/articles/360013417211-Where-do-I-place-the-Gurobi-license-file-gurobi-lic).

## Check the installation and license

Run this check in the activated environment on the compute node you intend to use:

```bash
conda activate gurobi
# Pass this Python snippet directly to the environment's interpreter.
python - <<'PY'
import gurobipy as gp

# Starting an environment checks licensing; leaving the block releases it.
with gp.Env() as env:
    print("Gurobi environment started successfully.")
PY
```

Review the license information printed at startup. Successful startup with a restricted license does not establish that your full-size model is licensed. This check starts a [Gurobi environment](https://docs.gurobi.com/projects/optimizer/en/current/reference/python/env.html); it does not solve a model.

## Use a JupyterHub terminal for persistent sessions

We recommend a terminal in [JupyterHub](jupyterhub.md) for interactive Gurobi work. JupyterHub sessions last up to seven days, and JupyterHub distributes sessions across compute nodes to spread the load.

Follow the [JupyterHub access instructions](jupyterhub.md#access), open a **Terminal** from the JupyterLab launcher, and activate your environment:

```bash
conda activate gurobi
```

Run your Python scripts from this terminal. Once Gurobi is installed, only `conda activate gurobi` is needed to select the environment for terminal use.

The terminal and its programs run on the server. Closing the browser or terminal tab leaves them running; reconnect to your existing JupyterHub server and use JupyterLab's **Running** panel to reopen the terminal. See [Managing Kernels and Terminals](https://jupyterlab.readthedocs.io/en/stable/user/running.html). Save results to files before the seven-day session ends; running programs also stop if the server is shut down or restarted.

Release Gurobi environments when finished, as in the `with gp.Env()` example above, or exit the Python process to release its license session. Closing a terminal tab alone does not release that session.

### Optional: use a notebook

Notebooks require a custom kernel so that their Python code runs in your Gurobi environment. Run this setup once in a JupyterHub terminal:

```bash
conda activate gurobi
# Install notebook support in the Gurobi environment.
conda install -c conda-forge ipykernel
# Register this environment as a notebook kernel for your account.
python -m ipykernel install --user --name gurobi --display-name "Python (gurobi)"
```

Select **Python (gurobi)** as the notebook's kernel. See [Adding a Conda Environment as a Jupyter Kernel](jupyterhub.md#adding-a-conda-environment-as-a-jupyter-kernel) for more details. Shut down unused notebook kernels to release any Gurobi sessions they retain; closing a notebook tab leaves its kernel running.

## Use in Slurm jobs

Follow the [Conda Slurm example](conda.md#using-in-slurm-jobs), replacing `conda activate myenv` with `conda activate gurobi` and `myscript.py` with your program. The environment and license file must be accessible from the compute node.

Set Gurobi's [Threads parameter](https://docs.gurobi.com/projects/optimizer/en/current/reference/parameters.html#parameterthreads) to the number of CPUs allocated to your task. For example, use `model.Params.Threads = 1` for a one-CPU task. See [Using Slurm Scheduler](slurm.md) for resource requests.
