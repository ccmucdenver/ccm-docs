# Python and Conda

## Managing Python packages
Python packages are evolving fast, and many depend on specific versions of other packages. Package managers have been created to 
install the packages user requires with their dependences automatically, but sometimes a combination of versions that would 
satisfy all dependences does not exist. 

You can use the system-provided Python, or many of our singularity container, each with their collection
of packages at different versions, including Python itself. But no fixed collection of Python packages versions can satisfy everyone's needs.

## Conda

The currently preferred solution is to to install your own Python packages for your specific needs in **Conda environments**. 
Conda environments are collections of packages compatible with each other. 
It is best not use `pip` to install Python packages in a Conda environment unless there is no other way. 
Pip does not try to check and resolve version conflicts and you can end up with a broken installation. 

Conda allows to install also other software packages besides Python. The invidual software instructions should list how, if conda packaging is available.

## Install Conda

Open an ssh window an alderaan and type 

     wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
     bash Miniforge3-Linux-x86_64.sh

and follow the directions. At the end, you should see the question
    
    Do you wish to update your shell profile to automatically initialize conda? 
    (...) [yes|no]
    
Answer yes.  Edit your `~/.bash_profile` file to add the line  

    source .bashrc
    
then log out and back in. The `conda` command should now be available.
 
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
    
     conda create --name myenv -c conda-forge python=3.6 paramiko gdal matplotlib tensorflow pandas

**conda-forge** is a channel (a collection of packages) available without licensing restrictions. See https://www.anaconda.com/docs/tools/working-with-conda/channels for more details and https://www.datacamp.com/blog/navigating-anaconda-licensing for licensing issues.

Of course, these are just examples,  use names of the packages and their versions that **you** need. Note that you can request specific versions of everything, even Python itself.
You can even create an environment with an old python version, for example:

     conda create --name py2numpy python=2.7 numpy

Conda will search for a combination of the versions of dependencies that allows it
to install what you asked for. It can install all packages at once, which often minimizes the chances of a version conflict. 
If Conda says that compatible versions of some packages cannot be found, you can create your enviroment with just a few or even one package, and add others in groups or one by one:

    conda activate myenv
    conda  install -c conda-forge netCDF4 PyGrib

It is best to install packages with many or hard to satisfy dependences first. These include tensorflow and gdal.
    
Finally, use pip to install packages that cannot be found:

    pip install MesoPy

You may want to deactivate Conda when you are not using the environment:

    conda deactivate
    
To make more environments, it is best to start again from the base environment like above.

Consistent use of `conda-forge` is recommended because some packages and versions may be available on conda-forge only, it is usually best to minimize incompatibility  
by pulling packages from the same channel.

Avoid the defaults and anaconda channels. Their use may require a commercial license if your organization has 200 or more employees or contractors, regardless of non-profit or academic status. Prefer conda-forge, which is free and community-maintained.and other channels (defaults, anaconda) are subject to licensing restrictions under some circumstances, such as when used in
a project which benefits a private company. See https://www.anaconda.com/pricing/terms-of-service-faqs for details.

It is recommended and sometimes necessary to create separate environments for projects with many dependencies, as too many dependencies tend to conflict eventually.
    
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

    cd /data001/projects/<username>
    rm -rf anaconda3
    
Then, edit `~/.bashrc` and delete the lines from

    # >>> conda initialize >>>
    
to 

    # <<< conda initialize <<<

 Finally, log out and back in.

    
    
