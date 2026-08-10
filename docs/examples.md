# Examples

##  A simple example batch job with Python on Alderaan 

Prepare your python code, say `hello.py` with the line

    print('hello')
    
and your batch script, say `hello.sh` in the same directory

     #!/bin/bash
     #SBATCH --job-name=hello
     #SBATCH --partition=math-alderaan
     #SBATCH --time=1:00:00            # Max wall-clock time 1 hour
     #SBATCH --ntasks=1                # number of cores 
     python3 hello.py
     
Then submit it

    sbatch hello.sh
    
    


## Batch job smoke test on GPU

Prepare this batch script, say `hello-gpu.sh`. For short GPU jobs, use the
higher-priority `math-alderaan-gpu-short` partition.

Example batch script `hello-gpu.sh`:

     #!/bin/bash
     #SBATCH --job-name=gpu
     #SBATCH --partition=math-alderaan-gpu-short
     #SBATCH --gres=gpu:a100:1
     #SBATCH --time=1:00:00                    # Max wall-clock time 1 hour
     #SBATCH --ntasks=1                        # number of cores

     hostname
     pwd
     nvidia-smi -L

** Please do not use Alderaan GPUs without allocating them by --gres as above first.** 

Submit your batch job by:

     sbatch hello-gpu.sh
     
For TensorFlow and older CUDA compatibility stacks, see [Singularity Containers](singularity.md).

## Interactive job on GPU

Look which host you are on. You should be on the head node.

     > hostname
     math-alderaan

Start an interactive job on a GPU node

     > srun -p math-alderaan-gpu-quick --time=02:00:0 --nodes=1 --ntasks=1 --gres=gpu:a100:1 --pty bash -i

Check where you are. If a GPU is available, you should be on a high memory/gpu node with a GPU allocated to you.

     > hostname
     math-alderaan-h01

Check GPU visibility

    > nvidia-smi

If you need a compatibility container for TensorFlow or older CUDA libraries, start a shell in

     > singularity shell --nv /storage/singularity/cuda12.2-tf.sif

and then do your Python there:

     Singularity> python3
     Python 3.8.10 (default, Nov 26 2021, 20:14:08)
     [GCC 9.3.0] on linux
     Type "help", "copyright", "credits" or "license" for more information.
     >>> from tensorflow.python.client import device_lib
     >>> 

When you are done, exit so that someone else can use the GPU node

     >>> exit()
     exit

## MPI examples

MPI examples are available at [https://github.com/ccmucdenver/templates.git](https://github.com/ccmucdenver/templates.git) To get your own copy,

    git clone https://github.com/ccmucdenver/templates.git
    
**MPI is on alderaan only**

## Single-core job

This script will be sufficient for many jobs, such as those you code yourself which do not use multiprocessing.

     #!/bin/bash
     # A simple single core job template
     #SBATCH --job-name=mpi_hello_single
     #SBATCH --partition=math-alderaan
     #SBATCH --time=1:00:00                    # Max wall-clock time
     #SBATCH --ntasks=1                        # number of cores, leave at 1
     examples/hello_world_fortran.exe          # replace by your own executable
    
     
If you run an application that can use more cores, you can requests the number of cores in <code>--ntask</code> parameter instead of 1. Your allocation will be charged for the time of all cores you requested, regardless if you use them or not.

If you expect that your application will use more memory than 8GB (our nodes have 512GB memory and 64 cores each), you should request more tasks, about the expected memory usage in GB divided by 8. Otherwise the node memory may get overloaded when the machine gets busy with many jobs, and everyone's jobs may stall or crash. Note: this may change once we start allocating memory use, but at the moment we do not.

##  Multiple single-core jobs using arrays

     #!/bin/bash
     # Multiple single core jobs using array template
     #SBATCH --job-name=mpi_hello_single
     #SBATCH --partition=math-alderaan
     #SBATCH --time=1:00:00                    # Max wall-clock time
     #SBATCH --ntasks=1                        # number of cores, leave at 1
     #SBATCH --array=1-5,10-11                 # specifies to submit this script 7 times where array values are 1, 2, 3, 4, 5, 10, and 11.
     
     examples/hello_world_fortran.exe          # replace by your own executable

SLURM job arrays simplify running multiple instances of the same job script using a single batch script. The above example demonstrates submitting the 'hello_world_fortran.exe' script seven times where array values are 1, 2, 3, 4, 5, 10, and 11.

_Helpful Directives/Variables_:

* %a: add the array number to naming convention. 

        #SBATCH --job-name=mpi_hello_single_%a

* %[insert-number]: Limit the number of array jobs to submit at a time. 

        #SBATCH --array=1-1000%10

    A SLURM array job automatically submits jobs within your allocated resources. If you wish to conserve resources for other tasks, it can be advantageous to control the number of array jobs submitted simultaneously. In the example provided above, a total of 1000 jobs are executed, with 10 jobs running concurrently at any given time. 

* SLURM_ARRAY_TASK_ID: An environment variable that holds the array value. You can use it to pass the array value to the script you intend to execute.

        python example_script.py ${SLURM_ARRAY_TASK_ID}

 
## A simple MPI job template

     #!/bin/bash
     # alderaan_mpi.sh
     # A simple MPI job template
     #SBATCH --job-name=mpi_hello
     #SBATCH --partition=math-alderaan
     #SBATCH --time=1:00:00                    # Max wall-clock time
     #SBATCH --ntasks=360                      # Total number of MPI processes, no need for --nodes
     mpirun examples/mpi_hello_world.exe       # replace by your own executable, no need for -np

## A more general MPI job template

You can request the number of nodes. The scheduler will then split the tasks over the nodes.

     #!/bin/bash
     # alderaan_mpi_general.sh
     # A a more general MPI job template
     #SBATCH --job-name=mpi_hello
     #SBATCH --partition=math-alderaan    
     #SBATCH --nodes=2                   # Number of requested nodes
     #SBATCH --time=1:00:00              # Max wall-clock time
     #SBATCH --ntasks=5                  # Total number of tasks over all nodes, max 64*nodes
     mpirun -np 10 examples/mpi_hello_world.exe # replace by your own executable and number of processors
     # do not use more MPI processes than nodes*ntasks
     
**Please do not request the number of nodes on Alderaan by `--nodes` or `-N`, unless you really need entire nodes for some reason. Request only the CPU cores you need by `--ntasks`, then the node or nodes you use can be shared with others.**
