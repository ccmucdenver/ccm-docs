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
