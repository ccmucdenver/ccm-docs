# Python

## Managing Python packages
Python packages are evolving fast, and many depend on specific versions of other packages. Package managers have been created to 
install the packages user requires with their dependences automatically, but sometimes a combination of versions that would 
satisfy all dependences does not exist. 

You can use the system-provided Python, or our tensorflow.sif singularity container, each with their collection
 of packages. But no fixed collection of Python packages can satisfy everyone's needs.

The currently preferred solution is to encourage users to install their own Python
library with one or more separate collections of packages for their various needs. Conda from the 
Anaconda distribution is perhaps the most popular package manager, and it maintains such collections called **environments**.

Do not use `pip` to install packages unless there is no other way. It does not try to resolve version conflicts and you 
can end up with a broken installation. 
 

## Install Anaconda
Go to [www.anaconda.org](https://www.anaconda.org), click Download Anaconda, Linux installers,
 right click on the 64-Bit (x86) Installer, and copy the link.
Open an ssh window an alderaan, type `wget` and paste the link to create a command line like

    wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
    
and press enter. (The file name will change in future versions.) After the installer downloads,

    /bin/sh Anaconda3-2021.11-Linux-x86_64.sh
    
accept the license, and follow through with the installation. You should see 
    
    Do you wish the installer to initialize Anaconda3 by running conda init? [yes|no]
    
Answer yes. Then, stop Conda from activating if you do not use it,

    conda config --set auto_activate_base false

as suggested by the installer. Log out and log in back again.

## Create Conda environments and install packages

Activate the base environment:
    
    conda activate
    
You should see your prompt change to start with `(base)`. Create your first environment, for example:
    
     conda create --name myenv python=3.6 paramiko gdal matplotlib tensorflow pandas

Of course, these are just examples,  use names of the packages and their versions that **you** need. Note that you can request specific versions of everything, even Python itself.

 Conda will search for a combination of the versions of dependencies that allows it
to install what you asked for. It is best to install all packages at once to minimize the chances of a version conflict. If Conda says that some packages cannot be found, leave installing them for the next step. 

Now, use the conda-forge repository to add into the environment the packages that could not be found in the previous step:

    conda activate myenv
    conda  install -c conda-forge netCDF4 PyGrib
    
Finally, use pip to install packages that cannot be found even on conda-forge:

    pip install MesoPy

You may want to deactivate Conda when you are not using the environment:

    conda deactivate
    conda deactivate
    
To make more environments, it is best to start again from the base environment like above.
    
## Using Conda environments in a batch script

Make a batch script like this:

    #!/bin/bash
    #SBATCH --partition=math-alderaan
    #SBATCH --job-name=conda
    #SBATCH --nodes=1                         # Number of requested nodes
    #SBATCH --time=1:00:00                    # Max wall time
    #SBATCH --ntasks=1                      # Number of tasks per job
    #
    # first emulate what happens at login
    eval "$($HOME/anaconda3/bin/conda shell.bash hook)"
    # now we can do what we normally would at the command line
    conda activate myenv
    python mycode.py
    
and submit to the scheduler using sbatch as usual.

## Uninstalling Anaconda

Sometimes you may need to uninstall Anaconda, e.g. to save space, or if something goes wrong and you need to start over.
Delete the Anaconda install directory

    cd; rm -rf anaconda3
    
Then, find the startup file where the Anaconda installer made its changes, usually `~/.bashrc`, and delete the lines from

    # >>> conda initialize >>>
    
to 

    # <<< conda initialize <<<
    


    
    
