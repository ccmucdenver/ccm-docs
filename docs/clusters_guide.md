# Guide to CCM Clusters
## General Use Information
### Logging In

The clas-compute system uses (mostly) CentOS 7 and 8 operating system. At this time, the main way of using the system is to use an SSH client to login to a terminal session on clas-compute or math-alderaan. You will need to be on the CU Denver network (wired or CU Denver wireless, not CU Denver Guest), or using the university's VPN client.

This system uses your normal portal/email username and password.

On Windows, you will need an SSH client. There are several out there, but generally most people use PuTTY which is available for download [here](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html). You can use either 32 or 64 bit versions - computers that require the 32 bit version are rather rare (early Windows 7/Vista/XP). The Host Name is clas-compute.ucdenver.pvt. 

<!---
(image is from the old system, but same difference)
[[File:Puttywindows.png|center|PuTTY Windows]]
-->

You can also use the [Windows 10 subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10), where you install a Linux distribution as an app and can use it to ssh out like from a terminal window like on any Linux machine. This is often more stable than Putty, which tends to get stuck on some computers.

On Macintosh, you can use simply the Terminal app, which is built into the operating system.
It is in Applications -> Utilities folder. You may want to drag it to your dock so that it is available more conveniently next time.

Either way, from a terminal window, at the command line prompt type in:

    ssh awesomeperson@clas-compute.ucdenver.pvt
    
or

    ssh awesomeperson@math-alderaan.ucdenver.pvt

Whereas awesomeperson would be your CU Denver username. After connecting, it should ask for your CU Denver password and enter it at this point.

Science will then occur and you should be at the clas-compute prompt or math-alderaan and in your home directory. The following applies to both.

###Interactive Use

Using a server ‘interactively’ (aka not scheduling a job) is often needed for troubleshooting a job or just watching what it is doing in real time. After SSH’ing into math-compute, you can type <code>ssh math-colibri-i01</code> or whatever server you want to go directly to the server. **Please do not run anything directly on compute nodes, which are reserved for jobs under the control of the scheduler, even if you may be able to ssh there.  These are nodes with names like math-colibri-c01 with the "c" before the number. Using compute nodes, where other people run jobs through the scheduler, will interfere with their work and make you very unpopular.**

Using 'screen' is generally a good idea both math-compute, math-alderaan, or the interactive nodes. Basically was screen does is starts a virtual terminal inside your terminal. Sound confusing? It is. The plus of this virtual terminal is if you get disconnected, whatever you were running is still going.

'screen –S bananaphone' (make the name whatever you want) creates a new terminal with that name

If you want to disconnect from the screen but leave it running, hit the combination of Control-A and press the D key to disconnect. Control-A is the combo to let screen know you want to do an action.

When you want to reconnect to the screen later, log back onto wherever you started the screen and type <code>screen –r</code>. If you have more than one screen, it’ll complain and tell you the screens you have available to reconnect to. <code>screen –r ‘bananaphone’</code> to reconnect to that screen. Sometimes there is a number in front of the screen so <code>screen –r 3128.bananaphone</code>. It’ll tell you the number in the <code>screen –r</code> info screen.

### File Storage

Math home directories are on a shared server with 40TB total (right now). Projects are found in /storage/department/projects (where department may be one of many departments who use this system).

For example, the mixtures project is in <code>/storage/math/projects/mixtures</code>.

If you need a lot of data storage, please contact Joe before filling everything you can find.

df –h will show you the storage arrays and how much space is available. There are different types of "empty" space in linux so it may say there is plenty of space in df –h yet the array is full.

### Passwords

The system uses your normal UCD portal/email logon username and password. Users must be approved before using the system, so if your login is not working, you probably are not on the approved/initialized list yet.

## Requesting Information about the Environment

### Queues

There are queues for different departments on math-compute because it points to a central scheduler for all of CLAS. To see these queues (called "partitions"), type 

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

The templates batch scripts and simple examples to run are in <code>/storage/templates</code>. You can copy the scripts from there, or git clone your own from [https://github.com/ccmucdenver/templates.git](https://github.com/ccmucdenver/templates.git) and build also the examples: Type <code>make</code> in the <code>examples</code> directory. 

#### Single-core job

This script will be sufficient for most jobs, such as those you code yourself which do not use multiprocessing.

     #!/bin/bash
     # A simple single core job template
     #SBATCH --job-name=mpi_hello_single
     #SBATCH --partition=math-alderaan
     #SBATCH --time=1:00:00                    # Max wall-clock time
     #SBATCH --ntasks=1                        # number of cores, leave at 1
     examples/hello_world_fortran.exe          # replace by your own executable
     
If you run an application that can use more cores, you can requests the number of cores in <code>--ntask</code> parameter instead of 1. Your allocation will be charged for the time of all cores, regardless if you use them or not.

If you expect that your application will use more memory than 8GB (our nodes have 512GB memory and 64 cores each), you should request more tasks, about the expected memory usage in GB divided by 8. Otherwise the node memory may get overloaded when the machine gets busy with many jobs, and everyone's jobs may stall or crash. Note: this may change once we start allocating memory use, but at the moment we do not.
 
#### A simple MPI job template

     #!/bin/bash
     # alderaan_mpi.sh
     # A simple MPI job template
     #SBATCH --job-name=mpi_hello
     #SBATCH --partition=math-alderaan
     #SBATCH --time=1:00:00                    # Max wall-clock time
     #SBATCH --ntasks=360                      # Total number of MPI processes, no need for --nodes
     mpirun examples/mpi_hello_world.exe       # replace by your own executable, no need for -np

#### A more general MPI job template

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
     
## Interactive jobs through the scheduler

```
srun -p PARTITION --time=2:00:0 -N 1 -n 1 --pty bash -i
```

## Viewing Job Queues and Job Status

The <code>squeue</code> command is used to gather information from the scheduler. Just <code>squeue</code> will show one line for each
job running on the system.

## Custom application software

We install software enviroments in containters, which provide a complete enviroment, avoid software conflicts, and can execute anywhere on the cluster.
Using singulariry is easy. Type, for example,

    singularity shell /storage/singularity/tensorflow
    python3
    
and you can use many Python packages for machine learning. We have containers with statistics software, optimization, molecular chemistry, and mode. **We will be happy to add more, do not hesitate to ask!** See [Singularity](../singularity/) in this documentation for further details. 
