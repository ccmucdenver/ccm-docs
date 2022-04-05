# Singularity Containers

A singularity container provides a custom environment to run an application with all of its dependencies. It avoids conflicts when different applications require different versions of libraries or other dependences, and it can mak your results reproducible. You can even copy a container to another machine with different versions of system software (with some limitations of course) with singularity installed, and all will look to your application the same. 

Software with complicated dependencies is often distributed as singularity containters, with their own runtime environment. Singularity containers are large files, many GB. If you have any containters, put them in yout project directory. **Please do not store singularity containers in your home directory.**

We often install software requested by users in singularity containers rather than on the system itself to provide the required versions of dependencies and to avoid software conflicts.

## How to Use

To start a shell in a container,

     singularity shell containerpath.sif

for example

     singularity shell /storage/singularity/tensorflow.sif

## What containers we have
Containers we have built are in `/storage/singularity`.
To see what is in a container, start with a short description which should be provided by every container:

     singularity run-help containerpath.sif
      
For more details you can look how the software in the container was built. This is was done by a script, called definition file, which you can see by

     singularity inspect --deffile containerpath.sif

Then start a shell in the container as above, and you can do whatever you normally do to examine softwares and their versions.

Note: building a container will pick up current version of software, so the versions below will change when containers are rebuilt.

### CentOS8-DevelopmentTools.sif

CentOS Linux 8.4.2105, gcc 8.4.1 and standard Development Tools from Centos.

### go.sif

The Go language with gcc/gfortran 9 and development tools, based on Ubuntu.

### mixtures.sif

R 4.1.2 with numerous standard and custom packages and datasets, see the definition file.

### pyscipopt.sif

The [PySCIPOpt](https://pypi.org/project/PySCIPOpt) 3.2.2. Interface to the SCIP Optimization Suite, python 3.7.11.

### qvina.sif

Modecular chemistry software [QuickVina](https://github.com/QVina/qvina), gcc, gfortran, python3.

### sagemath.sif

[SageMath](https://www.sagemath.org) mathematical sofrware, with python 3.9.5, R 4.0.4, and others.

### tensorflow.sif

python3.8.20 (gcc 9.3.9) as python 3, with numpy 1.22.2 and tensorflow 2.8.0 with sklearn matplotlib keras keras-tuner tensorflow_datasets pandas opencv-python-headless,
CUDA 11.4, jupyter 1.0.0, jupyterhub 2.1.1

Note: tensorflow will run with or withough GPU, but it will crash python on most colibri nodes because their CPUs and GPUs are too old.

### tensorflow-v1.2.sif and tensorflow-v1.3.sif

Earlier versions of tensorflow, which can run on older CPUs.






