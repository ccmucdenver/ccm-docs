# Examples 

## Long interactive job with Tensorflow on GPU

Start a sceen virtual terminal (screen) sessiom:

> screen -S gpu 

Look which host you are on:

> hostname
math-alderaan
`
bash-4.4$ srun -p math-alderaan-gpu --time=7-00:00:0 -N 1 -n 1 --pty bash -i 

bash-4.4$ hostname

math-alderaan-h01

bash-4.4$ singularity shell /storage/singularity/tensorflow.sif 
Singularity> python3

Python 3.8.10 (default, Nov 26 2021, 20:14:08) 

[GCC 9.3.0] on linux

Type "help", "copyright", "credits" or "license" for more information.

>>> from tensorflow.python.client import device_lib

>>> 

then ctrl-A D or disconnect
when you log in next
screen -r
or
screen -r gpu
and you are back

