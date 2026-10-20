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

## Using the WLS license

The standard Academic WLS license allows two concurrent Gurobi sessions and is valid for 90 days, with extensions while you remain eligible. It is for your own academic research, teaching, or coursework; do not share its credentials. See [Gurobi's WLS requirements](https://support.gurobi.com/hc/en-us/articles/34672988479633-What-are-the-restrictions-on-using-an-academic-WLS-license), and direct licensing questions or requests for additional sessions to Gurobi support.

After a program exits, its session can still count toward the limit for up to five minutes with default settings. If Gurobi reports "Too many sessions", close unused Gurobi programs or notebook kernels and wait for their license tokens to expire. See [Gurobi's session-limit explanation](https://support.gurobi.com/hc/en-us/articles/34567582787345-How-do-I-resolve-the-error-Too-many-sessions).

Save the license file as `$HOME/gurobi.lic`. Gurobi searches this location automatically. Keep the file private, especially when it contains WLS credentials:

```bash
# Allow only your account to read or write the license file.
chmod 600 "$HOME/gurobi.lic"
```

For an alternative location, set `GRB_LICENSE_FILE` to the full path to the file, including its filename. See [Gurobi's license file locations](https://support.gurobi.com/hc/en-us/articles/360013417211-Where-do-I-place-the-Gurobi-license-file-gurobi-lic).

## Named-user academic license

A named-user academic license is an alternative for work on one fixed machine: it lasts up to a year and allows parallel jobs without WLS's default two-session limit, but is tied to that machine and does not support containers. See [Gurobi's license comparison](https://support.gurobi.com/hc/en-us/articles/360040541251-How-do-I-obtain-a-free-academic-license).

Each Alderaan compute node counts as a separate computer and would need its own named-user license. A license obtained for one node does not cover other nodes. See [Gurobi's guidance on multiple computers](https://support.gurobi.com/hc/en-us/articles/360040995151-How-do-I-use-Gurobi-on-multiple-computers-for-my-academic-research).

## Check the installation and license

Run this check in the activated environment on the compute node you intend to use:

```bash
conda activate gurobi
# Pass this Python snippet directly to the environment's interpreter.
python - <<'PY'
import gurobipy as gp

# Starting an environment checks licensing; leaving the block closes it.
with gp.Env() as env:
    print("Gurobi environment started successfully.")
PY
```

Review the license information printed at startup. Successful startup with a restricted license does not establish that your full-size model is licensed. This check starts a [Gurobi environment](https://docs.gurobi.com/projects/optimizer/en/current/reference/python/env.html); it does not solve a model.

## Use a JupyterHub terminal for persistent sessions

We recommend a terminal in [JupyterHub](jupyterhub.md) for interactive Gurobi work. The default server runtime is seven days; you can select the runtime when starting the server. Slurm schedules your JupyterHub server on a compute node.

Follow the [JupyterHub access instructions](jupyterhub.md#access), open a **Terminal** from the JupyterLab launcher, and run the shared example:

```bash
conda activate gurobi
bash /shared/templates/examples/gurobi/simple.sh
```

Expected result: `x=2, y=2, objective=10`. The shared examples in `/shared/templates/examples/gurobi` need only read access; no cloning or script edits are required.

Run your Python scripts from this terminal. Once Gurobi is installed, only `conda activate gurobi` is needed to select the environment for terminal use.

The terminal and its programs run on the server. Closing the browser or terminal tab leaves them running; reconnect to your existing JupyterHub server and use JupyterLab's **Running** panel to reopen the terminal. See [Managing Kernels and Terminals](https://jupyterlab.readthedocs.io/en/stable/user/running.html). Save results to files before the selected runtime expires; running programs also stop if the server is shut down or restarted.

Close Gurobi environments when finished, as in the `with gp.Env()` example above, or exit the Python process. The license token can remain occupied for up to five more minutes with default settings. Closing a terminal tab alone does not close the Gurobi environment.

### Optional: use a notebook

Notebooks require a custom kernel so that their Python code runs in your Gurobi environment. Run this setup once in a JupyterHub terminal:

```bash
conda activate gurobi
# Install notebook support in the Gurobi environment.
conda install -c conda-forge ipykernel
# Register this environment as a notebook kernel for your account.
python -m ipykernel install --user --name gurobi --display-name "Python (gurobi)"
```

Copy the shared notebook into your home directory so you can save its output:

```bash
cp -i /shared/templates/examples/gurobi/simple.ipynb ~/gurobi-test.ipynb
```

Open `gurobi-test.ipynb` in JupyterLab, select **Python (gurobi)** as its kernel, and run the code cell. Expected result: `x=2.0, y=2.0, objective=10.0`. See [Adding a Conda Environment as a Jupyter Kernel](jupyterhub.md#adding-a-conda-environment-as-a-jupyter-kernel) for more details.

To shut down an unused notebook kernel:

1. Save the notebook.
2. Open the **Running** panel in JupyterLab's left sidebar.
3. Find the notebook's kernel and click its **Shut Down** control.

This stops computation and clears Python variables from memory; the saved notebook remains. Closing the notebook tab alone leaves its kernel running. See [Managing Kernels and Terminals](https://jupyterlab.readthedocs.io/en/stable/user/running.html).

The WLS token can still count toward the session limit for up to five more minutes with default settings.

## Use in Slurm jobs

Submit the shared example from your home directory so the output file is writable:

```bash
conda activate gurobi
cd ~
sbatch /shared/templates/examples/gurobi/simple.slurm
```

The job uses one CPU, 512 MB of memory, and a two-minute time limit on `math-alderaan-quick`. It inherits your activated environment. Output goes to `~/gurobi-JOBID.out`, where `JOBID` is the submitted job number, and should include `x=2, y=2, objective=10`.

For your own programs, follow the [Conda Slurm example](conda.md#using-in-slurm-jobs), replacing `conda activate myenv` with `conda activate gurobi` and `myscript.py` with your program. The environment and license file must be accessible from the compute node.

Set Gurobi's [Threads parameter](https://docs.gurobi.com/projects/optimizer/en/current/reference/parameters.html#parameterthreads) to the number of CPUs allocated to your task. For example, use `model.Params.Threads = 1` for a one-CPU task. See [Using Slurm Scheduler](slurm.md) for resource requests.
