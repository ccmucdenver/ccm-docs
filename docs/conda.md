# Conda and Python

## Managing Python packages

You can use the system-provided Python, or many of our singularity containers, each with their collection of packages at different versions, including Python itself. But no fixed collection of Python packages versions can satisfy everyone's needs. Python packages are evolving fast, and many depend on specific versions of other packages.

## Why Conda

Package managers have been created to install the packages user requires with their dependences automatically, but sometimes a combination of versions that would satisfy all dependences does not exist. Conda provides isolated **environments* for collections of software packages, including Python and non-Python software. This avoids dependency conflicts and often eliminates the need for custom Singularity containers.

## Installing Miniforge

We use **Miniforge**, which defaults to the **conda-forge** channel — a community-maintained collection with no licensing restrictions. Avoid the `defaults` and `anaconda` channels to stay clear of commercial license issues.

On a compute node (e.g. `ssh math-alderaan`):

```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
```

At the end, say **yes** to:

```
Do you wish to update your shell profile to automatically initialize conda?
```

Then edit your `~/.bash_profile` and add:

```bash
source .bashrc
```

Log out and back in. The `conda` command should now work. If you wish to avoid auto-activating the base environment:

```bash
conda config --set auto_activate_base false
```

## Creating and Managing Environments

Create an environment with specific packages, for example:

```bash
conda create -n myenv -c conda-forge python=3.11 numpy gdal tensorflow openmpi
```

Activate it:

```bash
conda activate myenv
```

To install additional packages in an evironment, first activate it, then:

```bash
conda install -c conda-forge netCDF4 PyGrib
```

Only use `pip` if a Python package isn’t on `conda-forge`:

```bash
pip install MesoPy
```

Deactivate when done:

```bash
conda deactivate
```

Keep packages from one project in a dedicated environment.

## Using in Slurm Jobs

Example batch script:

```bash
#!/bin/bash
#SBATCH --partition=math-alderaan
#SBATCH --job-name=myjob
#SBATCH --time=1:00:00
#SBATCH --ntasks=1

source ~/.bashrc
conda activate myenv
python myscript.py
```

Submit with:

```bash
sbatch myjob.sh
```

## Uninstalling Conda

To remove Miniforge:

```bash
rm -rf ~/miniforge3
```

Then clean up your `~/.bashrc` and `~/.bash_profile`.

