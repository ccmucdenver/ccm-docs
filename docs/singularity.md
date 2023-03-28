# Singularity Containers

A singularity container provides a custom environment to run an application with all of its dependencies. It avoids conflicts when different applications require different versions of libraries or other dependences, and it can make your results reproducible. You can even copy a container to another machine with different version of operating system software (with some limitations of course) with singularity installed, and all will look to your application the same. 

Software with complicated dependencies is often distributed as singularity containters, with their own runtime environment. Singularity containers are large files, many GB. If you have any containters, put them in your project directory. **Please do not store singularity containers in your home directory.**

We often install software requested by users in singularity containers rather than on the system itself to provide the required versions of dependencies, avoid software conflicts, and allow them to run on all of our clusters. 

You will have access to your files as usual, but the operating system and applications are replaced by those in the container.


## How to use Singularity interactively

**Please do not run computationally intensive jobs on the front end machines, math-alderaan or clas-compute.**

So, if you plan to do anything of substance, first ssh to an interactive node (recommended math-colibri-i01 with 1TB memory, or math-score-i01 with faster newer cpu) or start an [interactive batch job](../clusters_guide/#interactive-jobs), e.g.,

    srun -p math-alderaan --time=2:00:0 -n 1 --pty bash -i

Then start a shell in a container,

    singularity shell containerpath.sif

for example

     singularity shell /storage/singularity/tensorflow.sif
     

## How to run Singularity in a single-node batch job

Prepare the commands you want to execute inside the container as a file, say `mycode.sh`, make it executable
     
     chmod +x mycode.sh
     
and write a batch job script file that executes your code inside the container,
say `singularity_alderaan_shell.slurm`, like this:

     #!/bin/bash
     #SBATCH --job-name=singularity
     #SBATCH --partition=math-alderaan
     #SBATCH --nodes=1                   # Number of requested nodes
     #SBATCH --time=1:00:00              # Max wall-clock time
     #SBATCH --ntasks=1                  # Total number of tasks over all nodes, max 64*nodes

     singularity exec /storage/singularity/container.sif ./mycode.sh
     
where `container` is the container name. Instead of a shell script, you can use an executable binary such as compiled C code, or call python from inside the container like `python3 mycode.py`, etc. You can also copy your shell script inside the batch script and deal with only one file, like this:

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
more cores. **If your singularity job uses lot of memory, please increase --ntasks to 
about 8 GB per core even if you may not use the cores. Otherwise, node memory may get
overloaded with unfortunate consequences such as jobs stuck and 
nodes down until someone resets them.**

See [Examples](../examples) for more.

## How to run Singularity with MPI and on multiple nodes

Not so easy for MPI over the fast interconnect InfiniBand. Coming soon.
                                                                                                                          
## What containers we have

Containers we have built are in `/storage/singularity`.

To see what is in a container, start with a short description which should be provided by every container:

     singularity run-help containerpath.sif
      
For more details you can look how the software in the container was built. This is was done by a script, called definition file, which you can see by

     singularity inspect --deffile containerpath.sif

Then start a shell in the container as above, and you can do whatever you normally do to examine softwares and their versions.

Note: building a container will pick up current version of software, so the versions below will change when containers are rebuilt.

### bfctools.sif

Bioinformatics sofware bfctools 1.15.1 for processing and analyzing sequencing data.

### CentOS8-DevelopmentTools.sif

CentOS Linux 8.4.2105, gcc 8.4.1 and standard Development Tools from Centos.

### go.sif

The Go language with gcc/gfortran 9 and development tools, based on Ubuntu.

### mixtures.sif

R 4.1.2 with numerous standard and custom packages and datasets, see the definition file.

### pyscipopt-geopandas.sif
 
Optimization software [PySCIPOpt](https://pypi.org/project/PySCIPOpt) pyscipopt 4.2.0, ipopt, glpk, pyomo, gurobi, with geopandas.

### qvina.sif

Modecular chemistry software [QuickVina](https://github.com/QVina/qvina), gcc, gfortran, python3.

### sagemath.sif

[SageMath](https://www.sagemath.org) mathematical sofrware, with python 3.9.5, R 4.0.4, and others.

### saige.sif

Genomic software [saige](https://saigegit.github.io/SAIGE-doc/docs/Installation.html) container from docker image wzhou88/saige:1.1.6, comes with R 3.6.3.

### tensorflow.sif

python3.8.20 (gcc 9.3.9) as python 3, with numpy 1.22.2 and tensorflow 2.8.0 with sklearn matplotlib keras keras-tuner tensorflow_datasets pandas opencv-python-headless,
CUDA 11.4, jupyter 1.0.0, jupyterhub 2.1.1

Note: tensorflow will run with or withough GPU, but it will crash python on most colibri nodes because their CPUs and GPUs are too old.

### tensorflow-v1.2.sif and tensorflow-v1.3.sif

An earlier versions of tensorflow, which can run on older CPUs.






