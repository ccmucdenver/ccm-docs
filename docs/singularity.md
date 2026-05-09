# Singularity Containers

## What is a container?

When running in a container, you have access to your files as usual, but the operating system and intstalled software are replaced by those in the container.

Container is somewhat like a different computer just for you, similar to a virtual machine. 

## How do we use containers?

A system administrator can build a containter with installed software instead of installing it directly on the system. This allows to keep everything the software needs nicely together, and to run the software on different nodes, even with different versions of linux, without reinstalling anything. 

We are using a type of containers called Singularity, which was developed with HPC in mind. You may have heard about Docker, which is similar.

Software with complicated dependencies is often distributed as singularity containters, with their own runtime environment. Singularity containers are **large** files, many GB. If you bring any containters of your own, please put them in your project directory and **do not store singularity containers in your home directory.**

We often install software requested by users in singularity containers rather than on the system itself to provide the required versions of dependencies, avoid software conflicts, and allow them to run on all of our clusters. 

## How do I put software in a container?


## Building Singularity containers

Building a Singularity container requires root privileges, so you can't build a container directly on our systems yourself.  Ask, and we may be able to build a container for you with software you need if we do not have one already. Most of our containers originated this way.

But you can build a Docker container first, push to the Docker Hub, and pull as a Singularity
container without root privileges. Here is a 
[complete example](legacy/docker_to_singularity.md).

Also, nothing stops you from setting up your own linux machine with 
the same version of Singularity we have, building a container, and copying it here. 

## How to use a Singularity container interactively

**Please do not run computationally intensive jobs on the front end machine `math-alderaan`.**

So, if you plan to do anything of substance, first start an [interactive batch job](clusters_guide.md#interactive-jobs), e.g.,

    srun -p math-alderaan --time=2:00:0 -n 1 --pty bash -i

will start a slurm job with one core reserved for 2 hours and return with a standard shell prompt. Then start a shell in a container, for example

     singularity shell /storage/singularity/tensorflow.sif
     
and start exploring.

## How to run Singularity in a slurm batch job

Prepare the commands you want to execute inside the container as a file, say `mycode.sh`, and make the file executable
     
     chmod +x mycode.sh
     
Then, write a batch job script file that executes your code inside the container,
say `singularity_alderaan_shell.slurm`, like this:

     #!/bin/bash
     #SBATCH --job-name=singularity
     #SBATCH --partition=math-alderaan
     #SBATCH --nodes=1                   # Number of requested nodes
     #SBATCH --time=1:00:00              # Max wall-clock time
     #SBATCH --ntasks=1                  # Total number of tasks over all nodes, max 64*nodes

     singularity exec /storage/singularity/your_container.sif ./mycode.sh
     
where `your_container.sif` is the actual container filename you want to use. Instead of a shell script, you can use an executable binary such as compiled C code, or call python from inside the container like `python3 mycode.py`, etc. You can also copy your shell script inside the batch script si that you can deal with only one file, like this:

     #!/bin/bash
     #SBATCH --job-name=singularity
     #SBATCH --partition=math-alderaan
     #SBATCH --nodes=1                   # Number of requested nodes
     #SBATCH --time=1:00:00              # Max wall-clock time
     #SBATCH --ntasks=1                  # Total number of tasks over all nodes, max 64*nodes

     singularity shell /storage/singularity/your_container.sif << EOF
     echo This is a shell command which gets executed in the singularity container
     EOF
     
Finally, submit the job as usual: 

     sbatch singularity_alderaan_shell.slurm

If the commands you invoke inside the singularity container can take advantage of
more than one core, you can increase the job parameter `--ntasks` to reserve and use 
more cores. 

## How to run Singularity with GPUs

For GPUs, use the flag `--nv` as follows:

```
    singularity exec --nv /storage/singularity/your_container.sif
```
or
```
    singularity shell --nv /storage/singularity/your_container.sif
```
This makes the container use NVIDIA drivers libraries from the node, and it is particularly important if you use a container to run a different version of CUDA than installed on the node. You may need to do that because different versions of TensorFlow and PyTorch work only with certain CUDA versions.

## How to run Singularity with MPI and on multiple nodes

Not so easy for MPI over the fast interconnect InfiniBand. In future.
                                                                                                                          
## What containers we have

Containers we have built are in `/storage/singularity`.

To see what is in a container, start with a short description which should be provided by every container:

     singularity run-help /storage/singularity/your_container.sif
      
For more details, you can look how the software in the container was built. This is was done by a script, called definition file, which you can see by

     singularity inspect --deffile /storage/singularity/your_container.sif

You can see that the script is exactly like installing your own Linux machine after you installed a base system from distribution media.

Then start a shell in the container as above, and you can do whatever you normally do to examine softwares and their versions.

Note: Container inventory changes over time. Some older images remain for continuity and compatibility and may be legacy or may not work on all nodes or software stacks.

### Recommended/current starting points

These are the most useful containers for most current Alderaan workflows:

- `cuda12.2-tf.sif`:
  Compatibility container for TensorFlow and older CUDA-dependent software on current Alderaan GPU nodes. Use with `singularity exec --nv` or `singularity shell --nv`.
- `tensorflow.sif`:
  Older general TensorFlow container still present in storage.
- `jupyterhub.sif`:
  Lightweight Jupyter environment.
- `mixtures.sif`:
  Project-specific container for the mixtures workflow.
- `poppler.sif`:
  CPU-oriented Python/data-science container with Poppler and related packages.
- `pyscipopt-geopandas.sif`:
  Optimization and geospatial container with PySCIPOpt, Pyomo, Gurobi, and geopandas.

### Current inventory on Alderaan (2026/05/08)

The following container images were present in `/storage/singularity` when this page was reconciled with the live system:

```text
bio-lowry.sif
biopython.sif
cactus-gpu.sif
cuda-116.sif
cuda-120.sif
cuda12.2-tf.sif
go.sif
jupyterhub.sif
mixtures.sif
poppler.sif
pyscipopt-geopandas.sif
qvina.sif
rserver-launcher-centos7.simg
sagemath.sif
saige.sif
tensorflow-1.4-new.sif
tensorflow-1.4.sif
tensorflow-2.6.0-cuda-11.2.sif
tensorflow.sif
tensorflow_latest-gpu-jupyter.sif
tensorflow_nvidia.sif
tf-1.4.sif
tf14.sif
tf2.sif
wine-7f0a88.sif
wine.sif
```

Use `ls -1 /storage/singularity` on Alderaan to check the current live inventory.
