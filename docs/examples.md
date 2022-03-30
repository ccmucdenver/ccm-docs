# Examples 

## long interactive job with Tensorflow on GPU

Start a sceen virtual terminal (screen) sessiom:

     > screen -S gpu 

Look which host you are on. You should be on the head node.

     > hostname
     math-alderaan

Start a 2-day interactive job on a GPU node

     > srun -p math-alderaan-gpu --time=2-00:00:0 -N 1 -n 1 --pty bash -i 

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
     >>> import mycode

Your code is running. Disconnect from the virtual terminal

     ctrl-A D 

or just disconnect. When you log in next 

     > hostname
     math-alderaan
     > screen -r gpu
     >>>

and you are back in your session.

