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
    
    


## Batch job with Tensorflow on GPU using Singularity

Prepare two files as follows.

Example batch script `alderaan_single_gpu.sh`:

     #!/bin/bash
     #SBATCH --job-name=gpu
     #SBATCH --partition=math-alderaan-gpu
     #SBATCH --time=1-1:00:00                  # Max wall-clock time 1 day 1 hour
     #SBATCH --ntasks=1                        # number of cores 

     # run tensorflow in singularity container
     # redirect output to a file so that it can be inspected before the end of the job
     singularity exec /storage/singularity/tensorflow.sif python3 gpucode.py >& gpucode.log 
     # copy the output to the job output for reference
     cat gpucode.log

Example python code `gpucode.py`:

     print('gpus available to tensorflow:')
     from tensorflow.python.client import device_lib    
     print(device_lib.list_local_devices())
     print("done") 

Submit your batch job by:

     sbatch alderaan_single_gpu.sh
     
You can find the files above in the repository https://github.com/ccmucdenver/templates

## Interactive job with Tensorflow on GPU

Look which host you are on. You should be on the head node.

     > hostname
     math-alderaan

Start an interactive job on a GPU node

     > srun -p math-alderaan-gpu --time=02:00:0 -N 1 -n 1 --pty bash -i 

Check where you are. You should be on a high memory/gpu node.

     > hostname
     math-alderaan-h01

Start a shell in a container

     > singularity shell /storage/singularity/tensorflow.sif 

Do your python:

     Singularity> python3
     Python 3.8.10 (default, Nov 26 2021, 20:14:08)
     [GCC 9.3.0] on linux
     Type "help", "copyright", "credits" or "license" for more information.
     >>> from tensorflow.python.client import device_lib
     >>> 

When you are done, exit so that someone else can use the gpu node

     >>> exit()
     exit

## MPI examples

MPI examples are available at [https://github.com/ccmucdenver/templates.git](https://github.com/ccmucdenver/templates.git) To get your own copy,

    git clone https://github.com/ccmucdenver/templates.git
    
**MPI is on alderaan only**
