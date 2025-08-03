# Singularity Containers

## What is a container?

When running in a container, you have access to your files as usual, but the operating system and intstalled software are replaced by those in the container.

Container is somewhat like a different computer just for you, similar to a virtual machine. 

## How do we use containers?

A system administrator can build a containter with installed software instead of installing it directly on the system. This allows to keep everything the software needs nicely together, and to run the software on different nodes, even with different versions of linux, without reinstalling anything. 

We are using a type of containers called Singularity, which was developed with HPC in mind. You may have heard about Docker, which is similar.

Software with complicated dependencies is often distributed as singularity containters, with their own runtime environment. Singularity containers are **large** files, many GB. If you bring any containters of your own, pleasee put them in your project directory and **do not store singularity containers in your home directory.**

We often install software requested by users in singularity containers rather than on the system itself to provide the required versions of dependencies, avoid software conflicts, and allow them to run on all of our clusters. 

## How do I put software in a container?


## Building Singularity containers

Building a Singularity container requires root privileges, so you can't build a container directly on our systems yourself.  Ask, and we may be able to build a container for you with software you need if we do not have one already. Most of our containers originated this way.

But you can build a Docker container first, push to the Docker Hub, and pull as a Singularity
container without root privileges. Here is a 
[complete example](docker_to_singularity.md).

Also, nothing stops you from setting up your own linux machine with 
the same version of Singularity we have, building a container, and copying it here. 

## How to use a Singularity container interactively

**Please do not run computationally intensive jobs on the front end machines, math-alderaan or clas-compute.**

So, if you plan to do anything of substance, first ssh to an interactive node (recommended math-colibri-i01 with 1TB memory, or math-score-i01 with a faster and newer cpu). Or, start an [interactive batch job](../clusters_guide/#interactive-jobs), e.g.,

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

     singularity exec /storage/singularity/container.sif ./mycode.sh
     
where `container` is the container name. Instead of a shell script, you can use an executable binary such as compiled C code, or call python from inside the container like `python3 mycode.py`, etc. You can also copy your shell script inside the batch script si that you can deal with only one file, like this:

     #!/bin/bash
     #SBATCH --job-name=singularity
     #SBATCH --partition=math-alderaan
     #SBATCH --nodes=1                   # Number of requested nodes
     #SBATCH --time=1:00:00              # Max wall-clock time
     #SBATCH --ntasks=1                  # Total number of tasks over all nodes, max 64*nodes

     singularity shell /storage/singularity/container.sif << EOF
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

Containers we have built are in `/storage/singularity`. For convenience, `/storage/singularity/container.sif` points to a sample container.

To see what is in a container, start with a short description which should be provided by every container:

     singularity run-help /storage/singularity/your_container.sif
      
For more details, you can look how the software in the container was built. This is was done by a script, called definition file, which you can see by

     singularity inspect --deffile /storage/singularity/container.sif

You can see that the script is exactly like installing your own Linux machine after you installed a base system from distribution media.

Then start a shell in the container as above, and you can do whatever you normally do to examine softwares and their versions.

Note: Rebuilding a container usually picks up current version of software, so the versions listed below may change when containers are rebuilt.

### bfctools.sif

Bioinformatics sofware bfctools 1.15.1 for processing and analyzing sequencing data. Based on Ubuntu 20.04 with Development Tools.

### bio-lowry.sif

Ubuntu 20.04 with Development Tools and biology packages bbmap megahit megabat checkm gtdbtkUbuntu 20.04 with Development Tools and biology packages bbmap megahit megabat checkm gtdbtk.

### biopython.sif

Biopython 1.78 in Anacoda 3 Python 3.9.13 based on Ubuntu 20.04.

### cactus-gpu.sif

Imported Docker quay.io/comparative-genomics-toolkit/cactus:v2.5.2-gpu

### CentOS8-DevelopmentTools.sif

CentOS Linux 8.4.2105, gcc 8.4.1 and standard Development Tools from Centos.

### cuda-116.sif

Imported Docker nvidia/cuda:11.6.1-devel-ubuntu20.04

### cuda-120.sif

Ubuntu 22.04 with cuda 12.0, NVIDIA compilers, tensorflow, pytorch, and other common machine learning packages

### cuda12.2-tf.sif

Ubuntu 22.04 with cuda 12.2, tensorflow, and machine learning tools suitable for nodes installed with CUDA 12.9 and required upgraded NVIDIA drivers, currently `math-alderaan-h01`.

### go.sif

The Go language with gcc/gfortran 9 and development tools, based on Ubuntu 20.04

### mixtures.sif

Custom container for the mixtures project. R 4.1.2 with  raresim, plink2, Python with  regenie, bcftools, pliknk,hapgen2, bedtools. etc., and datasets. Based on Ubuntu 22.04

### poppler.sif

Container with python3-poppler-qt5, tensorflow, sklearn, matplotlib, keras, keras-tuner, tensorflow_datasets, pdf2image, jupyterhub, jupyter and pandas. No CUDA. Based on Ubuntu 22.04

### pyscipopt-geopandas.sif
 
Optimization software [PySCIPOpt](https://pypi.org/project/PySCIPOpt) pyscipopt 4.2.0, ipopt, glpk, pyomo, gurobi, with geopandas in miniconda and Ubuntu 21.04 

### qvina.sif

Modecular chemistry software [QuickVina](https://github.com/QVina/qvina), gcc, gfortran, python3 on Ubuntu 21.04

### sagemath.sif

[SageMath](https://www.sagemath.org) mathematical sofrware, SAGE 9.5 with R 4.2.1 and Python 3.10.6 on Ubuntu 22.04.

### saige.sif

Genomic software [saige](https://saigegit.github.io/SAIGE-doc/docs/Installation.html) container from docker image wzhou88/saige:1.1.6, comes with R 3.6.3.

### tensorflow-1.4-new.sif

Cuda 11, tensorflow 1.4, sklearn, matplotlib, keras, keras-tuner, tensorflow_datasets, pdf2image and pandas, on Ubuntu 20.04

Note: Tensorflow will run with or without GPU, but it will crash python on most colibri nodes because their CPUs and GPUs are too old.

### tensorflow-v1.4.sif

cuda 11, tensorflow 1.4, sklearn, matplotlib, keras, keras-tuner, tensorflow_datasets, pdf2image and pandas.

### tensorflow-2.6.0-cuda-1.1.2.sif

NVIDIA nvidia/cuda:11.2.2-base-ubuntu20.04 with Anaconda and cuDNN 8 added. 

### tensorflow.sif

Cuda 11, tensorflow, sklearn, matplotlib, keras, keras-tuner, tensorflow_datasets, pdf2image, jupyterhub, jupyter and pandas.

### tensorflow_latest-gpu-jupyter.sif

Cuda 11, tensorflow 1.4, sklearn, matplotlib, keras, keras-tuner, tensorflow_datasets, pdf2image and pandas.
