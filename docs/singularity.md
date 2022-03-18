# Singularity Containers

## How to Use

To start a shell in a container,

     singularity shell containerpath.sif

for example

     singularity shell /storage/singularity/tensorflow.sif

## What containers we have
Containers we have built are in `/storage/singularity`.
To see the contents of a container, start by reviewing the definition file, which the scriptthat was used to build the container, by something like

     singularity inspect --deffile containerpath.sif

Then start a shell in the container as above, and you can do whatever you would  on a regular machine to examine softwares and their versions.

Note: building a container will pick up current version of software, so the versions below will change when containers are rebuilt.
### tensorflow.sif

python3.8.20 (gcc 9.3.9) as python 3, with numpy 1.22.2 and tensorflow 2.8.0 with sklearn matplotlib keras keras-tuner tensorflow_datasets pandas opencv-python-headless,
CUDA 11.4, jupyter 1.0.0, jupyterhub 2.1.1

Note: tensorflow will run with or withough GPU, but it will crash python on most colibri nodes because their CPUs and GPUs are too old.

### tensorflow-v1.2.sif and tensorflow-v1.3.sif

Older versions of tensorflow 1, which can run on older CPUs.

### mixtures.sif

R 4.1.2 with numerous standard and custom packages and datasets, see the definition file.

### CentOS8-DevelopmentTools.sif

CentOS Linux 8.4.2105, gcc 8.4.1 and standard Development Tools from Centos..

### qvina.sif

Modecular chemistry software [QuickVina](https://github.com/QVina/qvina), gcc, gfortran, python3.

### sagemath.sif

[SageMath](https://www.sagemath.org) mathematical sofrware, with python 3.9.5, R 4.0.4, and others.

### pyscipopt.sif

The [PySCIPOpt](https://pypi.org/project/PySCIPOpt) 3.2.2. Interface to the SCIP Optimization Suite, python 3.7.11.





