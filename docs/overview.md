# Alderaan Overview

## Configuration

* 32 compute nodes with 64 cores and 512GB memory each, 30 available.
* 2 nodes with 2TB memory and 2 NVIDIA A100 GPUs each,
* 800TB storage (1PB raw).

## Quick basics 

* From the CU Denver | Anschutz network, connect by using your university username and password:
 * in a web browser to [Jupyterhub](../jupyterhub) to **[https://math-alderaan.ucdenver.pvt](https://math-alderaan.ucdenver.pvt)**, or
 * by [Remote Desktop](../remote_desktop) (use Windows App on macOS) to **math-alderaan**, or
 * on the command line by **ssh username@math-alderaan.ucdenver.pvt**

* Use the SLURM schueduler:
 * Write a job script, with the commands to execute and special
 comments how many cores and which kind of node it needs (=partition name)
 * Submit the script to the SLURM scheduler. See [examples](../examples) for details.
 * The scheduler finds a compute node with enough free cores and memory, marks the resources you requested as allocated, and starts executing the job script on the node.

## Quick Tips 

* If you need software that is not installed on Alderaan, you can
  * check if it may be available in one of our [singularity containers](../singularity)
  * check if it may be availale in a [module](../clusters_guide/#where-is-the-software-modules-and-singularity-containers)
  * install it in your account using [Conda](../conda)
  * ask for it to be installed, which may be typically done in a new singularity container or module

* In your SLURM job,
 * request an estimated number of cores your code needs, if you do not know exactly how many (e.g., some codes in R)
 * if you run sofware that needs [modules](../modules) loaded first: add `module load module_name` in your job script. 

* If you need to run on compute nodes interactively, not as a script, you can:
  * use [Jupyterhub](../jupyterhub), which provides multiple terminal and notebook windows with dedicated resources
  * run interactively on an alderaan node by entering the magic line   
    `srun --pty -N 1 -n 1 -t 1:00:00 -p math-alderaan /bin/bash -l`  
on math-alderaan. This example will start an interactive shell job on one alderaan
core for one hour max and teleport your session to that shell. 
    
* If you need to run Python with custom environments, use [Conda](../conda).

* If you have an MPI code (to use multiple cores and nodes as a single large computer), ask
 for enough cores and run your executable as an argument to the `mpirun` command. Make
 sure you use the same MPI version (GNU or Intel) to build and run the code. 
 See https://github.com/ccmucdenver/templates for examples.
