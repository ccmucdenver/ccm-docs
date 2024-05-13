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

Open an ssh window an alderaan and type 

     cd /data001/projects/<username>
     wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
     bash Miniconda3-latest-Linux-x86_64.sh

and follow the directions. Override the default location for the installation location by

    /data001/projects/<username>/miniconda3

Here, <username> stands for your username. **It is important to use a directory in /data001 or /data002, because of performance issues with locations in `/home` or `/storage`, which may make some conda commands not work.** At the end, you should see the question
    
    Do you wish to update your shell profile to automatically initialize conda? 
    (more text) [yes|no]
    
Answer yes.  Edit your `~/.bash_profile` file to add the line  

    source .bashrc
    
then log out and back in. The `conda` command should now be available
 
You can stop Conda from activating on login if you do not want to use it every time you log in, by

    conda config --set auto_activate_base false

as suggested by the installer. 

Notes: If you already have your own custom settings
in `~/.bash_profile` or `~/.bashrc`, you should review both files to make sure that they do what you intended, 
because a login shell will now source both files and the resulting environment may change. 
Initializing anaconda makes changes to your `~/.bashrc` file. 
When a new interactive shell starts it will source `~/.bashrc` and make `conda` available, 
but a login shell will source `~/.bash_profile` instead. See
`man bash` and search for INVOCATION for more details. 
You can't change `bash` to another shell because of the way how the authentication is set up on the clusters.

## Create Conda environments and install packages

Activate the base environment:
    
    conda activate
    
You should see your prompt change to start with `(base)`. Create your first environment, for example:
    
     conda create --name myenv python=3.6 paramiko gdal matplotlib tensorflow pandas

Of course, these are just examples,  use names of the packages and their versions that **you** need. Note that you can request specific versions of everything, even Python itself.
You can even create an environment with an old python version, for example:

     conda create --name py2numpy python=2.7 numpy

 Conda will search for a combination of the versions of dependencies that allows it
to install what you asked for. It is best to install all packages at once to minimize the chances of a version conflict. 
If Conda says that some packages cannot be found, leave installing them for the next step. 

Now, use the conda-forge repository to add into the environment the packages that could not be found in the previous step:

    conda activate myenv
    conda  install -c conda-forge netCDF4 PyGrib
    
Finally, use pip to install packages that cannot be found even on conda-forge:

    pip install MesoPy

You may want to deactivate Conda when you are not using the environment:

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
    # first emulate what happens at login or interactive shell
    source ~/.bashrc
    # now we can do what we normally would at the command line
    conda activate myenv
    python mycode.py
    
and submit to the scheduler using sbatch as usual.

## Uninstalling Anaconda

Sometimes you may need to uninstall Anaconda, e.g. to save space, or if something goes wrong and you need to start over.
Delete the Anaconda install directory

    cd
    rm -rf anaconda3
    
Then, edit `~/.bashrc` and delete the lines from

    # >>> conda initialize >>>
    
to 

    # <<< conda initialize <<<
    

    
    
