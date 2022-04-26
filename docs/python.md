# Python
Python is a large open source projects. 

## Install Anaconda
Go to https://www.anaconda.com/products/distribution right click on 64-Bit (x86) Installer and copy the link
Open ssh window an alderaan, type `wget` paste the link to get command line like

    wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
    
and press enter. (The file name will change in future versions.) After the installer downloads,

    /bin/sh Anaconda3-2021.11-Linux-x86_64.sh
    
accept the license, and follow through with the installation. You should see 
    
    Do you wish the installer to initialize Anaconda3 by running conda init? [yes|no]
    
Answer yes. Then, to stop Conda from activating if you do not use it,

    conda config --set auto_activate_base false

as suggested by the installer. Log out and log in back again.

## Create Conda environments and install packages

Activate the base environment:
    
    conda activate
    
You should see your prompt change to starting with `(base)`. Create your first environment, for example:
    
     conda create --name myenv python=3.6 paramiko gdal matplotlib tensorflow pandas
     
The best practice is to install all packagesonce to minimize potential version conflicts. If some packages cannot be found, leave them for later.

Now use the conda-forge repository to add into environment the packages that could not be found in the previous step:

    conda activate myenv
    conda  install -c conda-forge netCDF4 PyGrib
    
Finally, use pip to install packages that cannot be found even on on conda-forge:

    pip install MesoPy

And test:
    python
    import netCDF4 as nc4
    print(nc4.__version__)
    
You may want to deactivate Conda when you are not using the environment:

    conda deactivate
    conda deactivate
    
To make more environments, it is best practice to start again from the base environment like above.
    
## Using a Conda environment in a batch script

Make a batch script like this

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


    
    
