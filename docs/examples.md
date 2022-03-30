# Examples

## Interactive job with Tensorflow on GPU

Look which host you are on. You should be on the head node.

     > hostname
     math-alderaan

Start an interactive job on a GPU node

     > srun -p math-alderaan-gpu --time=02:00:0 -N 1 -n 1 --pty bash -i 

Check where you are. You shouild be on a high memory/gpu node.

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

