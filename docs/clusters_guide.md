# Guide to CCM Clusters

## Logging in

### How to log in

The system uses CentOS 7 and 8 operating system. There are two head nodes (entry points) to the system, `math-alderaan.ucdenver.pvt` and `clas-compute.ucdenver.pvt`. You can use either. Alderann cluster runs Centos 8 while the other clusters and `clas-compute` run Centos 7.

At this time, the main way of using the system is to use an SSH client to login to a terminal session on clas-compute or math-alderaan. You will need to be on the CU Denver network (wired or CU Denver wireless, not CU Denver Guest), or using the university's VPN.

This system uses your normal portal/email username and password, but user account must be set up before using the system. Please go to [accounts](../accounts/) to request an account.

On Linux or a Mac, you can use simply the Terminal app, which is built into the operating system. It is hidden away in Applications -> Utilities folder on a Mac and in similar places on various Linux desktops. You may want to drag it to your dock (on a Mac) or the desktop (on Linux) so that it is available more conveniently next time.

On Windows, you will need an SSH client.  Recent builds of Windows 10 and 11 have a [native ssh client](https://learn.microsoft.com/en-us/windows/terminal/tutorials/ssh) - just type `ssh` in a terminal window (also called powershell window or command window). The ssh client also has `scp` and `sftp` for file transfer. 

Otherwise you can use PuTTY which is available for download [here](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html). You can use either 32 or 64 bit versions - computers that require the 32 bit version are rather rare (early Windows 7/Vista/XP).

![Putty Windows](img/Puttywindows.png)


You can also use the [Windows 10 subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10), where you install a Linux distribution as an app and can use it to ssh out like from a terminal window on any Linux machine. This is often more stable than Putty, which tends to get stuck on some computers.

Either way, from a terminal window, at the command line prompt type in:

    ssh username@clas-compute.ucdenver.pvt
    
or

    ssh username@math-alderaan.ucdenver.pvt

The username is your account name, a single short word which you can use to log into the university portal instead of email address, not the firstname.lastname in your university email. Contact us or OIT helpdesk at [ucd-oit-helpdesk@cuanschutz.edu](mailto:ucd-oit-helpdesk@cuanschutz.edu) if you do not know what your account name is.

After connecting, ssh should ask for your CU Denver password and you enter it at this point. You should be then at the `math-alderaan` or `clas-compute` prompt and in your home directory, which is `/home/username`. 

### Interactive use

Using a server ‘interactively’ (aka not scheduling a job) is often needed for troubleshooting a job or just watching what it is doing in real time. After SSH’ing into a head node, you can type <code>ssh math-colibri-i01</code> or whatever server you want to go to directly. 

**Please do not run anything directly on compute nodes, which are reserved for jobs under the control of the scheduler, even if you may be able to ssh there.  These are nodes with names like math-colibri-c01 with something else than "i" before the number. Using compute nodes, where other people run jobs through the scheduler, will interfere with their work and make you very unpopular.** It is OK to ssh to a compute node to check on your job, but  don't run anything there.


### Screen virtual terminal

If you use `screen`, if you get disconnected, whatever you were running is still going and you can connect to it later. This is called a virtual terminal session. It is generally a good idea to use `screen` on math-compute, math-alderaan, or on the interactive nodes.  

Typing `screen` creates a new terminal session. You can give it a name you want to juggle more sessions, by `screen -S 'name'`  (make the name whatever you want). 

If you want to disconnect from the session but leave it running, hit the combination of Control-A and press the D key to disconnect. Control-A is the combo to let screen know you want to do an action.

When you want to reconnect to your screen session later, log back onto wherever you started the screen and type <code>screen –r</code>. If you have more than one screen, it’ll complain and tell you the screens you have available to reconnect to. Type <code>screen –r 'name’</code> to reconnect to that screen. 
 
You can't just scroll in `screen` to see your terminal history as you normally would.
Press Control-A and then Esc and scrolling up and down will work temporarily the usual way. When you type anything, `screen` will leave the scrolling model.

## File Storage

**You are responsible for keeping copies of your important files elsewhere. Files and entire filesystems can be lost.** 

The home directories are on a shared file server and linked as `/home/username`. Everyone can have also 
a project directory `/storage/department/projects/username` 
(where department may be one of many departments who use this system). Users from some departments have
project directories created in `/data001/projects/username` instead. These are currently accessible from alderaan nodes only,
i.e., not accessible from clas-compute and math-colibri or math-score nodes. The location of project directory is emailed to the user
when the directory is created, usualy as a part of onboarding.

The difference betwen project and home directories is that home directories are backed up occasionally 
while project directories are not. Please keep your home directory small to make the backups possible.

In addition, groups can reqquest shared project directories also in `/storage/department/projects' or `/data001/projects`. 

Please monitor the usage of the partition you are on by 

     df -h . 

and if it nearing full check you you do not use more space than you are aware of by `df -h`. If you need a lot of data storage, please contact us before filling everything you can find.

On Alderaan only, you can make your own directory in `/scratch`, which is on a large fast filesystem.
When `/scratch` starts filling up, oldest files will be purged automatically. 

**Do not keep any confidential or sensitive files on this system.** We are not equipped for the level of security this would take. 
In particular, no proprietary data, health records, grades, social security numbers, and like are allowed. 
If you use ssh keys to connect elsewhere from this system 
(such as github or another computer account), it is highly recommended to make an ssh key with a passcode for that. Otherwise,
 the security of the account you are connecting to is only as good as the read protection of your files here.

Files and directories including your home directory are created with permissions which allow anyone to read them but not 
write. This is Linux default to encourage collaboration. If you want to keep a file or directory private, you need to change the permissions yourself. 
Type <code>chmod og-rwx file_or_directory_name</code> to make the file or directory not accessible by others (except system administrators, of course).


<!---
`df –h` will show you the storage arrays and how much space is available. There are different types of "empty" space in linux so it may say there is plenty of space in `df –h` yet the array is full.
-->

## File Transfer

### Linux or Mac

On a Linux or Mac computer, you can use file transfer utilities, which are a part of the system, to transfer files between the clusters and your computer. [Rsync](https://en.wikipedia.org/wiki/Rsync) is recommended. Typing `man rsync` should give you the manual for the system you are on. Rsync can transfer file trees recursively and resume a transfer which was interrupted.

### Windows

On Windows, you need to install an addidional application. There include, e.g., FileZilla. 

### From a Website

coming soon

### Github

coming soon

### Dropbox

coming soon

### Globus

coming soon

## Requesting Information about the Environment

### Queues

Jobs are submitted to compute nodes through the scheduler.  To see the queues (called "partitions") on the scheduler, type 

    $ sinfo
    PARTITION         AVAIL  TIMELIMIT  NODES  STATE NODELIST
    math-alderaan        up 7-00:00:00      1 drain* math-alderaan-c28
    math-alderaan        up 7-00:00:00      4    mix math-alderaan-c[01,08-10]
    math-alderaan        up 7-00:00:00     25  alloc math-alderaan-c[04-07,11-27,29-32]
    math-alderaan        up 7-00:00:00      2   idle math-alderaan-c[02-03]
    math-alderaan-gpu    up 7-00:00:00      1    mix math-alderaan-h01
    math-alderaan-gpu    up 7-00:00:00      1  alloc math-alderaan-h02
    math-colibri-gpu     up   infinite     24   idle math-colibri-c[01-24]
    math-score           up   infinite      5   idle math-score-c[01-05]
    chem-xenon           up   infinite      6   unk* chem-xenon-c[01-06]
    clas-interactive     up   infinite      1   idle math-colibri-i02
    math-alderaan-osg    up 1-00:00:00      1 drain* math-alderaan-c28
    math-alderaan-osg    up 1-00:00:00      4    mix math-alderaan-c[01,08-10]
    math-alderaan-osg    up 1-00:00:00     25  alloc math-alderaan-c[04-07,11-27,29-32]
    math-alderaan-osg    up 1-00:00:00      2   idle math-alderaan-c[02-03]
    clas-dev             up   infinite      1   idle clas-devnode-c01

### Nodes
To see a list of all nodes, use:

     $ sinfo -N
     NODELIST           NODES         PARTITION STATE 
     chem-xenon-c01         1        chem-xenon unk*  
     chem-xenon-c02         1        chem-xenon unk*  
     chem-xenon-c03         1        chem-xenon unk*  
     chem-xenon-c04         1        chem-xenon unk*  
     chem-xenon-c05         1        chem-xenon unk*  
     chem-xenon-c06         1        chem-xenon unk*  
     clas-rcdesktop-01      1    clas-rcdesktop down* 
     math-alderaan-c01      1     math-alderaan alloc 
     math-alderaan-c02      1     math-alderaan alloc 
     math-alderaan-c03      1     math-alderaan alloc 
     math-alderaan-c04      1     math-alderaan alloc 
     math-alderaan-c05      1     math-alderaan alloc 
     math-alderaan-c06      1     math-alderaan alloc 
     math-alderaan-c07      1     math-alderaan alloc 
     math-alderaan-c08      1     math-alderaan alloc 
     math-alderaan-c09      1     math-alderaan alloc 
     math-alderaan-c10      1     math-alderaan alloc 
     math-alderaan-c11      1     math-alderaan alloc 
     math-alderaan-c12      1     math-alderaan alloc 
     math-alderaan-c13      1     math-alderaan alloc 
     math-alderaan-c14      1     math-alderaan alloc 
     math-alderaan-c15      1     math-alderaan alloc 
     math-alderaan-c16      1     math-alderaan mix   
     math-alderaan-c17      1     math-alderaan idle  
     math-alderaan-c18      1     math-alderaan idle  
     math-alderaan-c19      1     math-alderaan idle  
     math-alderaan-c20      1     math-alderaan idle  
     math-alderaan-c21      1     math-alderaan idle  
     math-alderaan-c22      1     math-alderaan idle  
     math-alderaan-c23      1     math-alderaan idle  
     math-alderaan-c24      1     math-alderaan idle  
     math-alderaan-c25      1     math-alderaan idle  
     math-alderaan-c26      1     math-alderaan idle  
     math-alderaan-c27      1     math-alderaan idle  
     math-alderaan-c28      1     math-alderaan idle  
     math-alderaan-c29      1     math-alderaan idle  
     math-alderaan-c30      1     math-alderaan idle  
     math-alderaan-c31      1     math-alderaan idle  
     math-alderaan-c32      1     math-alderaan idle  
     math-alderaan-h01      1 math-alderaan-gpu idle  
     math-alderaan-h02      1 math-alderaan-gpu idle  
     math-colibri-c01       1  math-colibri-gpu idle  
     math-colibri-c02       1  math-colibri-gpu idle  
     math-colibri-c03       1  math-colibri-gpu idle  
     math-colibri-c04       1  math-colibri-gpu unk*  
     math-colibri-c05       1  math-colibri-gpu unk*  
     math-colibri-c06       1  math-colibri-gpu unk*  
     math-colibri-c07       1  math-colibri-gpu unk*  
     math-colibri-c08       1  math-colibri-gpu unk*  
     math-colibri-c09       1  math-colibri-gpu unk*  
     math-colibri-c10       1  math-colibri-gpu unk*  
     math-colibri-c11       1  math-colibri-gpu unk*  
     math-colibri-c12       1  math-colibri-gpu unk*  
     math-colibri-c13       1  math-colibri-gpu idle  
     math-colibri-c14       1  math-colibri-gpu idle  
     math-colibri-c15       1  math-colibri-gpu idle  
     math-colibri-c16       1  math-colibri-gpu idle  
     math-colibri-c17       1  math-colibri-gpu idle  
     math-colibri-c18       1  math-colibri-gpu idle  
     math-colibri-c19       1  math-colibri-gpu idle  
     math-colibri-c20       1  math-colibri-gpu idle  
     math-colibri-c21       1  math-colibri-gpu idle  
     math-colibri-c22       1  math-colibri-gpu idle  
     math-colibri-c23       1  math-colibri-gpu idle  
     math-colibri-c24       1  math-colibri-gpu idle  
     math-score-c01         1        math-score unk*  
     math-score-c02         1        math-score unk*  
     math-score-c03         1        math-score idle  
     math-score-c04         1        math-score idle  
     math-score-c05         1        math-score idle  



It looks confusing but there is a method to the madness in the naming convention. Obviously, math-colibri and math-score are the identifiers for what cluster/building the servers are in, but the –c## and –i## stand for compute and interactive. The c## servers are usually part of the queuing system and the i## ones are for interactive use. Again, never ssh to compute nodes directly.

## Submitting Jobs to the Scheduler

### Submitting a job

The <code>sbatch job_script</code> command is used to submit a job into a queue. Your job starts executing in the directory where it was submitted, so submit it from a directory accessible to all compute nodes, such as a subdirectory of your home directory. You can add switches to the <code>sbatch</code> command, but it is recommended to make them a part of your batch script so that you do not have to do that every time. Please do not use more cores than the number of tasks specified in your script.

### Template batch job scripts

The template batch scripts and simple examples to run are available. Get your copy by
    
        git clone https://github.com/ccmucdenver/templates.git 
        
To build the examples, type <code>make</code> in the <code>examples</code> directory. 

**Please do not request the number of nodes on Alderaan by `--nodes` or `-N`, unless you really need entire nodes for some reason. Request only the CPU cores you need by `--ntasks`, then the node or nodes you use can be shared with others.**


### Single-core job

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
 
### Sending a job to a specific node
Add the following to your SBATCH directives

    #SBATCH --nodelist=math-alderaan-xxx

where xxx is the node you want to use. For more information, see [this link](https://stackoverflow.com/questions/50993346/how-to-run-a-job-on-a-specific-node-using-the-slurm).
### A simple MPI job template

     #!/bin/bash
     # alderaan_mpi.sh
     # A simple MPI job template
     #SBATCH --job-name=mpi_hello
     #SBATCH --partition=math-alderaan
     #SBATCH --time=1:00:00                    # Max wall-clock time
     #SBATCH --ntasks=360                      # Total number of MPI processes, no need for --nodes
     mpirun examples/mpi_hello_world.exe       # replace by your own executable, no need for -np

### A more general MPI job template

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

     
## How to use GPU 

### How to to run with GPU on Alderaan

The partition math-alderaan-gpu has two high memory/GPU nodes`math-alderann-h[01,02]` with two NVIDIA A-100 40GB GPUs and 2TB memory each. Use `--partition=math-alderaan-gpu` with `--gres=gpu:a100:1` to request one GPU and `--gres=gpu:a100:2` to request two GPUs. At the moment, Alderaan does not support explicit memory allocation by the --mem flag. 
 
**Please do not use Alderaan GPUs without allocating them by `--gres` as above first. Please do not request an entire node on Alderaan by `--nodes` or `-N`, unless you really need all of it, request only the CPU cores you need by `--ntasks`. Large memory jobs and GPUs jobs can share the same node.**

An example job script:
    #!/bin/bash
    #SBATCH --job-name=gpu
    #SBATCH --gres=gpu:a100:1
    #SBATCH --partition=math-alderaan-gpu
    #SBATCH --time=1:00:00                  # Max wall-clock time 1 day 1 hour
    #SBATCH --ntasks=1                        # number of cores
    singularity exec /storage/singularity/tensorflow.sif python3 yourgpucode.py

Of course, instead of singularity you can run another GPU code. It is recommended to use the tensorflow singularity container because it has updated CUDA drivers.


### How to run with GPUs on Colibri

 To use Colibri GPUs, do not use `--gres` but reserve a whole node by `--nodes=1`. Singularity containers work on Colibri, but current versions of tensorflow do not support the CPUs on Colibri. You can use an older version instead:
 
    #!/bin/bash
    #SBATCH --job-name=gpu
    #SBATCH --gres=gpu:a100:1
    #SBATCH --partition=math-colibri-gpu
    #SBATCH --time=1:00:00                  # Max wall-clock time 1 day 1 hour
    #SBATCH --nodes=1                       # number of nodes
    singularity exec /storage/singularity/tensorflow-v1.3.sif python3 yourgpucode.py
    
## Interactive jobs

Remember you should not directly ssh to a node because it would interfere with jobs scheduled to run on that node. For interactive access to a compute node, do instead:

```
srun -p math-alderaan --time=2:00:0 -n 1 --pty bash -i
```
This will request a session for you as a job in a single core slot on a compute node in the math-alderaan partition for up to 2 hours. After the job starts, your session is transfered to the node. The job will end when you exit or the time runs out. Of course you can do the same for other partitions and add other flags such as to request more cores or a GPU. 

To start an interactive job on Alderaan with a GPU:
```
srun -p math-alderaan-gpu --time=2:00:0 -n 1 --gres=gpu:a100:1 --pty bash -i
```

## Viewing Job Queues, Job Status, and System Status

The command <code>squeue</code> will show one line for each
job running on the system.

The command <code>sinfo</code> will show a summary of jobs and partitions status on the system:

    PARTITION         AVAIL  TIMELIMIT  NODES  STATE NODELIST
    math-alderaan        up 7-00:00:00     10    mix math-alderaan-c[01-10]
    math-alderaan        up 7-00:00:00      8  alloc math-alderaan-c[11-15,29,31-32]
    math-alderaan        up 7-00:00:00     14   idle math-alderaan-c[16-28,30]
    math-alderaan-gpu    up 7-00:00:00      1   drng math-alderaan-h01
    math-alderaan-gpu    up 7-00:00:00      1    mix math-alderaan-h02
    math-colibri-gpu     up   infinite     24   idle math-colibri-c[01-24]
    math-score           up   infinite      5   idle math-score-c[01-05]
    chem-xenon           up   infinite      6  down* chem-xenon-c[01-06]
    clas-interactive     up   infinite      1  down* math-score-i01
    clas-interactive     up   infinite      1   idle math-colibri-i02
    math-alderaan-osg    up 1-00:00:00     10    mix math-alderaan-c[01-10]
    math-alderaan-osg    up 1-00:00:00      8  alloc math-alderaan-c[11-15,29,31-32]
    math-alderaan-osg    up 1-00:00:00     14   idle math-alderaan-c[16-28,30]
    clas-dev             up   infinite      1   idle clas-devnode-c01

Real-time system status including temperature, load, and the partitions from `sinfo`, is available in [News and Status Updates](./updates/).


## Custom Application Software

Additional software can be installed as modules. Software in a module is on the system all the time, "loading" a module just changes your environment so that your commands can find it. Installed software and environment modules on our different clusters are generally different. See [modules](../modules) for more information.

We also use Singularity containters, which provide a complete enviroment, avoid software conflicts, and can execute anywhere on the clusters. The disadvantage, however, is that you can use only the software installed in the container; the system you are on is not visible from inside the container.

Using singularity is easy. Type, for example, 

    singularity shell /storage/singularity/tensorflow
    python3
    
and you can use many Python packages for machine learning. We have containers with statistics software, optimization, molecular chemistry, optimization,
and more. See [Singularity](../singularity/) for more details. 

**We will be happy to install software and build containers for you, do not hesitate to ask!** 

## Building Your Own Software

Here are the best practices when you compile and link your own software:

* Use `math-alderaan` head node to build software for use on the Alderaan cluster. Use `module avail` to see which tools are available in [modules](./modules/). We can add other tools and package them in modules on request.

* Use `clas-compute` or `math-colibri-i02` to build software for the Colibri cluster, and `clas-compute` or `math-score-i01` for the Score cluster. You can download and build libraries and other package in your own account.

* Alderaan runs Centos 8, while `clas-compute` and Colibri and Score clusters Centos 7. Software built on one will normally not work on the other. 
