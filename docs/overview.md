# Clusters Overview

## Configuration

* 32 compute nodes with 64 cores and 512GB memory each, 30 available.
* 2 nodes with 2TB memory and 2 NVIDIA A100 GPUs.
* 800TB storage (1PB raw).

## Quick basics 

* Connect by command line ssh to the head node,  
`ssh math-alderaan.ucdenver.pvt` 
or in a web browser to Jupyterhub 
[https://math-alderaan.ucdenver.pvt](https://math-alderaan.ucdenver.pvt),
using your university username and password. 

* Write a job script, say `myjob`, with the commands to execute and special
 comments how many cores and which kind of node it needs (=partition name). See
  [examples](../examples) for details.

* Submit the script to the SLURM scheduler by `sbatch myjob` 
 
* The scheduler finds a compute node with enough free cores and memory, marks the cores as allocated, and starts executing the job script on the node.


## Quick Tips 

* If you need software that is not installed on Alderaan, you can
  * check if it may be available in one of our [singularity containers](../singularity)
  * check if it may be availale in a module by `module avail`
  * install it in your account using [Conda](../conda) in many cases
  * ask for it to be installed, which may be done in a new singularity container or module

* Request an estimated number of cores your code needs, if you do not know exactly how many (e.g., some codes in R)

* If you run sofware that needs [modules](../modules) loaded first: add `module load module_name` in your job script. 

* If you need to run interactively, not as a script, you can:
  * use [Jupyterhub](../jupyterhub), which provides multiple terminal and notebook windows (7 days max)
  * run interactively on an alderaan node by entering the magic line   
    `srun --pty -N 1 -n 1 -t 1:00:00 -p math-alderaan /bin/bash -l`  
on math-alderaan. This command will start an interactive shell job on one alderaan
core for one hour max and transfer you to that shell session. (7 days max)
  * ssh to the interactive node  `math-colibri-i02` (Centos 7, unlimited)
    
* If you need to run Python with custom environments, use [Conda](../conda).

* If you have an MPI code (to use multiple cores and nodes as a single large computer), ask
 for enough cores and run your executable as an argument to the `mpirun` command. Make
 sure you use the same MPI version (GNU or Intel) to build and run the code. 
 See https://github.com/ccmucdenver/templates for examples.
