# Guide to CCM Clusters

## Logging in

### How to log in

Your account must be set up before using the system. Please go to [accounts](../accounts/) for more about getting an account.

To access the Alderaan cluster, you need to be on the CU Denver or CU Anschutz private network. This can be done in several ways:

* On campus wired network.
* On campus secure wireless network (not the guest network)/
* Through the remote desktop [https://remote.ucdenver.edu](https://remote.ucdenver.edu) After logging in, click on "Complimentary". It is recommended to download and use the VMware Horizon app instead of continuing in the browser.
* Through [CU Denver VPN](https://www.ucdenver.edu/vpn) or [CU Anschutz VPN](https://www.cuanschutz.edu/vpn). 

To log in, use your university username (not email) and password. If you do not know your username, you can retrieve it at [https://myaccount.ucdenver.edu/forgot-username](https://myaccount.ucdenver.edu/forgot-username).

High Performance Computing (HPC) systems like this one are usually accessed from a command line terminal window.

Perhaps the easiest way to log in is to use [JupyterHub](../jupyterhub). Simply go to 
[https://math-alderaan.ucdenver.pvt](https://math-alderaan.ucdenver.pvt)
and log in, which will give you a web page with a file navigation tree and one or more terminal windows. 
Should you not see a terminal window, press the + button on upper left to start the Launcher, 
then press the Terminal tile. You can also run Python notebooks, edit files, and more.

Another way of accessing the system is to use the Secure Shell (SSH). Type

    ssh math-alderaan.ucdenver.pvt

in a terminal window on Linux or Mac, or in a Powershell window on [Windows](https://learn.microsoft.com/en-us/windows/terminal/tutorials/ssh)
10 or 11 (Press Windows button, search box opens, type `shell`, select `Powershell`), and log in. For more convenience and security, you can 
set up [passwordless ssh from Linux](https://www.geeksforgeeks.org/how-to-login-to-ssh-without-a-password-using-private-key) as well as 
from [Windows](https://stackoverflow.com/questions/71422512/passwordless-ssh-connection-from-windows).

SSH also allows you to transfer files via scp, sftp, or rsync commands. 

Alderaan cluster runs Centos 8, while some additional legacy nodes run Centos 7.

### Interactive use limitations

Using a server ‘interactively’ (a.k.a. not scheduling a job) is often needed for troubleshooting a job or just watching what it is doing in real time. After SSH’ing into a head node, you can type <code>ssh math-colibri-i02</code> or whatever interactive server you want to go to directly. 

**Please do not run anything directly on compute nodes without a reservation. Theu are reserved for jobs under the control of the Slurm scheduler, even if you may be able to ssh there.  These are nodes with names like math-alderaan-c01 with something else than "i" before the number. Using compute nodes, where other people run jobs through the scheduler, will interfere with their work and make you very unpopular.** It is OK to ssh to a compute node to check on your job, but  don't run anything there.
   
### Screen virtual terminal in interactive usage

If you use `screen`, if you get disconnected, whatever you were running is still going and you can connect to it later. This is called a virtual terminal session. It is generally a good idea to use `screen` on math-compute, math-alderaan, or on the interactive nodes.  

Typing `screen` creates a new terminal session. You can give it a name you want to juggle more sessions, by `screen -S 'name'`  (make the name whatever you want). 

If you want to disconnect from the session but leave it running, hit the combination of Control-A and press the D key to disconnect. Control-A is the combo to let screen know you want to do an action.

When you want to reconnect to your screen session later, log back onto wherever you started the screen and type <code>screen –r</code>. If you have more than one screen, it’ll complain and tell you the screens you have available to reconnect to. Type <code>screen –r 'name’</code> to reconnect to that screen. 
 
You can't just scroll in `screen` to see your terminal history as you normally would.
Press Control-A and then Esc and scrolling up and down will work temporarily the usual way. When you type anything, `screen` will leave the scrolling model.

## File Storage

**You are responsible for keeping copies of your important files elsewhere. Files and entire filesystems can be lost.** 

The home directories are on a shared file server and linked as `/home/username`. Everyone can have also 
a project directory. The legacy project directories are  `/storage/department/projects/username` 
(where department may be one of many departments who use this system). New project directories are currently 
created as `/data001/projects/username` instead. The location of the project directory is emailed to the user
when the directory is created as a part of setting up a new accoun.

In addition, groups can request shared project directories also in `/storage/department/projects` or `/data001/projects`. 

The difference betwen project and home directories is that home directories are backed up occasionally (if not too large)
while project directories and too large home directories are not backed up. Please keep your home directory small to make the backups possible. 
Please be aware that even if disk space is large and currenly not restricted, it is finite.

Please monitor the usage of the partition you are on by 

     df -h . 

and if it nearing full check you you do not use more space than you are aware of by `df -h`. If you need a lot of data storage, please contact us before filling everything you can find.

On Alderaan, you can make your own directory in `/scratch`.
**When `/scratch` starts filling up or the space is needed for the system, oldest files will be purged automatically.**

**Do not keep any confidential or sensitive files on this system.** We are not equipped for the level of security this would take. 
In particular, proprietary data, health records, grades, social security numbers, or **data which have to comply with any 
law or regulation are not allowed**. 

If you use ssh keys to connect elsewhere from this system 
(such as github or another computer account), it is **highly recommended to make an ssh key with a passcode** for that. **Otherwise,
 the security of the account you are connecting to is only as good as the read protection of your files here, which is not much.**

Files and directories including your home directory are created with permissions which allow anyone to read them but not 
write. This is Linux default to encourage collaboration. If you want to keep a file or directory private, you need to change the permissions yourself. 
Type <code>chmod og-rwx file_or_directory_name</code> to make the file or directory not accessible by others (except system administrators, who can access anything).


<!---
`df –h` will show you the storage arrays and how much space is available. There are different types of "empty" space in linux so it may say there is plenty of space in `df –h` yet the array is full.
-->

## Where is the software? Modules and Singularity containers

We normally do not install application software directly on the system because of software dependencies and version conflicts. Instead, we install sofware in *modules* or *singularity containers*. You can also install software in your account yourself. The preferred way of doing that is by using **[Conda](../conda)**.

### Modules

To see what software is available in modules,

    module avail

provide a list of available software packages and their versions. A command `module load modulename/version` will change your environment (such as the `PATH` variable) temporarily so that the software and its various parts can be found, for example

    module load R/4.2.1

or

    module load matlab

Try that and use `env` command to see what has changed. 

You may need to load multiple modules at the same time. When you are done with a module you can `module unload` it but it is strongly recommended to do

    module purge

and start over loading exactly the modules you need, or simply log out and back in again.

Installed software and environment modules on our different clusters are generally different. See [modules](../modules) for more information.

### Singularity Containers

*See [Singularity Containers](../singularity/) for more details and a list of our containers*.

A singularity container is a bit like a separate computer in itself which just runs on the same hardware. Thus, software in different containers won't conflict, and a container can provide a complete environment including a different operating system, libraries, etc. A disadvantage, however, is that you can use only the software installed in the container; software on the system outside of the container is not visible from the inside. Containers are read only and cannot be changed. An exception is that some package managers, like conda, may allow installing software while you are inside the container. Additions made by conda this way actually reside in directory `.local` in your home directory.

Using singularity is easy. Type, for example, 

    singularity shell /storage/singularity/tensorflow
    python3
    
and you can use many Python packages for machine learning. We have containers with statistics software, optimization, molecular chemistry, optimization,
and more. 

### Old software versions

Sometimes, you may need a specific version of some software package from a few years ago. We'll try. If the software version is not too much in the past, we may be able to install the software in a module or in a singularity container. However, installing an older or a more complicated package may require recreating an entire software ecosystem at a certain point in computer history, which can be overwhelming or impossible when old versions of dependencies are hard to find or just no longer available.

## Installing your own software packages

When working with software like R on our shared system, it’s important to install packages to a personal library to prevent conflicts with other users. This guide will help you set up and manage your R library effectively.

By default, user-installed packages go to a hidden directory in your home directory, `~/.local`, which is also used by other languages (e.g., Python) and can sometimes lead to potential conflicts, such as when packages from different versions of the same language end up in `~/.local` and then get used by another version of the language. You may want to occasionally clear out this directory to reset your personal environment.

> **Warning**: Running `rm -rf ~/.local` will delete **all** your user-installed packages, not just for R but also for Python and other languages. Use this only if you're comfortable reinstalling necessary packages.

To manage this safely:

- **Selective Cleanup**: Instead of wiping `~/.local`, you might choose to delete only specific folders within `.local/lib` for R or Python packages. For example:
  ```bash
  rm -rf ~/.local/lib/R
  rm -rf ~/.local/lib/python3.8

- **Set a custom R library path**:
   - You can specify a custom directory for R packages instead of relying on `~/.local`.
   - Add the following to your `~/.Rprofile` file to create and use a dedicated directory for R packages:
     ```r
     # .Rprofile file
     dir.create(Sys.getenv("HOME"), "R_packages", showWarnings = FALSE)
     .libPaths(c("~/R_packages", .libPaths()))
     ```
   - This configuration will tell R to look in `~/R_packages` for user-installed packages, separate from `~/.local`.

## File Transfer

### Linux or Mac

On a Linux or Mac computer, you can use file transfer utilities `rsync`, `scp`, `sftp` on your computer to transfer files and entire directores between your computer and clusters. These utilities are normally a part of the system, if not you can install them from your Linux distribution. [Rsync](https://en.wikipedia.org/wiki/Rsync) is recommended. Typing `man rsync` should give you the manual for the system you are on. Rsync can transfer file trees recursively and resume a transfer which was interrupted.

### Windows

On current Windows PC, you can use `scp` and `sftp` from the command window (a.k.a. Powershell window). Current Windows 10 and 11 have OpenSSH client built in.

### From a Website

You can download a file from a website using simply `wget` followed by the URL of the file. You can get the URL of a file posted on the web by a right-click and selectingv something like "Copy link address".

### Github

The easiest way to download files from Github is to clone the entire repository. On the repository main page, click green button "Code" and copy the link. Then

    git clone <the link you just copied>
    
You can use https link if you want to clone the repository for reading only. If you want to push your changes to Github in future, [you need to use ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh). It is strongly recommended to create a separate key secured by a strong passphrase for this. Otherwise, the security of your Github account is only as good as the protection of files here - anyone who gains administrator access here can log into your Github account. 

### Dropbox

coming soon

### Globus

Globus is a free service which can transfer large files (many GB and TB) between servers on the internet using a simple web interface and without supervision. 
See the [Globus](../globus/) section how to use Globus here.

### ```scp``` Tutorial

<ins> Approach 1: Transferring file from local computer to Alderaan <ins>

Open a terminal or command line prompt shell. Do not log into Alderaan – stay connected to your local machine. Type command: 

    scp /path/to/file/on/computer [username]@math-alderaan.ucdenver.pvt:/path/to/file/on/alderaan 

For instance, if my CU Denver username is duffme, I had a file on my local machine located at ~/Desktop/Folder/file.txt, and I wanted to put this file in my home directory on Alderaan, I would use the command:  

    scp ~/Desktop/Folder/file.txt duffme@math-alderaan.ucdenver.pvt:/home/duffme 

<ins> Approach 2: Transferring file from Alderaan to local computer <ins>

Open a terminal or command line prompt shell. Do not log into Alderaan – stay connected to your local machine. Type command: 

    scp /path/to/file/on/computer [username]@math-alderaan.ucdenver.pvt:/path/to/file/on/alderaan 

For instance, if my CU Denver username is duffme, I had a file on Alderaan I wanted to transfer located at /home/duffme/file.txt, and I wanted to put this file on my local machine at  ~/Desktop, I would use the command:  

    scp duffme@math-alderaan.ucdenver.pvt:/home/duffme/file.txt ~/Desktop 


## Requesting Information about the Environment

### Queues

Jobs are submitted to compute nodes through the scheduler.  To see the queues (called "partitions") on the scheduler, type 

    $ sinfo
    PARTITION               AVAIL  TIMELIMIT  NODES  STATE NODELIST
    math-alderaan              up 7-00:00:00      2    mix math-alderaan-c[08,16]
    math-alderaan              up 7-00:00:00     25  alloc math-alderaan-c[01-06,09-15,17,21-29,31-32]
    math-alderaan              up 7-00:00:00      3   idle math-alderaan-c[18-20]
    math-alderaan-short        up 1-00:00:00      2    mix math-alderaan-c[08,16]
    math-alderaan-short        up 1-00:00:00     25  alloc math-alderaan-c[01-06,09-15,17,21-29,31-32]
    math-alderaan-short        up 1-00:00:00      3   idle math-alderaan-c[18-20]
    jupyter                    up 7-00:00:00      2    mix math-alderaan-c[08,16]
    jupyter                    up 7-00:00:00     25  alloc math-alderaan-c[01-06,09-15,17,21-29,31-32]
    jupyter                    up 7-00:00:00      3   idle math-alderaan-c[18-20]
    system_test                up 7-00:00:00      1   idle math-alderaan-c30
    math-alderaan-gpu        down 7-00:00:00      1  drain math-alderaan-h01
    math-alderaan-gpu-short    up 1-00:00:00      2    mix math-alderaan-h[01-02]
    math-score                 up   infinite      5  down* math-score-c[01-05]
    clas-interactive           up   infinite      2  down* math-colibri-i02,math-score-i01

### Nodes
To see a list of all nodes, use:

     $ sinfo -N
      sinfo -N
    NODELIST           NODES               PARTITION STATE 
    math-alderaan-c01      1     math-alderaan-short alloc 
    math-alderaan-c01      1                 jupyter alloc 
    math-alderaan-c01      1           math-alderaan alloc 
    math-alderaan-c02      1     math-alderaan-short alloc 
    math-alderaan-c02      1                 jupyter alloc 
    math-alderaan-c02      1           math-alderaan alloc 
    math-alderaan-c03      1     math-alderaan-short alloc 
    math-alderaan-c03      1                 jupyter alloc 
    math-alderaan-c03      1           math-alderaan alloc 
    math-alderaan-c04      1     math-alderaan-short alloc 
    math-alderaan-c04      1                 jupyter alloc 
    math-alderaan-c04      1           math-alderaan alloc 
    math-alderaan-c05      1     math-alderaan-short alloc 
    math-alderaan-c05      1                 jupyter alloc 
    math-alderaan-c05      1           math-alderaan alloc 
    math-alderaan-c06      1     math-alderaan-short alloc 
    math-alderaan-c06      1                 jupyter alloc 
    math-alderaan-c06      1           math-alderaan alloc 
    math-alderaan-c08      1     math-alderaan-short alloc 
    math-alderaan-c08      1                 jupyter alloc 
    math-alderaan-c08      1           math-alderaan alloc 
    math-alderaan-c09      1     math-alderaan-short alloc 
    math-alderaan-c09      1                 jupyter alloc 
    math-alderaan-c09      1           math-alderaan alloc 
    math-alderaan-c10      1     math-alderaan-short alloc 
    math-alderaan-c10      1                 jupyter alloc 
    math-alderaan-c10      1           math-alderaan alloc 
    math-alderaan-c11      1     math-alderaan-short alloc 
    math-alderaan-c11      1                 jupyter alloc 
    math-alderaan-c11      1           math-alderaan alloc 
    math-alderaan-c12      1     math-alderaan-short alloc 
    math-alderaan-c12      1                 jupyter alloc 
    math-alderaan-c12      1           math-alderaan alloc 
    math-alderaan-c13      1     math-alderaan-short alloc 
    math-alderaan-c13      1                 jupyter alloc 
    math-alderaan-c13      1           math-alderaan alloc 
    math-alderaan-c14      1     math-alderaan-short alloc 
    math-alderaan-c14      1                 jupyter alloc 
    math-alderaan-c14      1           math-alderaan alloc 
    math-alderaan-c15      1     math-alderaan-short alloc 
    math-alderaan-c15      1                 jupyter alloc 
    math-alderaan-c15      1           math-alderaan alloc 
    math-alderaan-c16      1     math-alderaan-short mix   
    math-alderaan-c16      1                 jupyter mix   
    math-alderaan-c16      1           math-alderaan mix   
    math-alderaan-c17      1     math-alderaan-short alloc 
    math-alderaan-c17      1                 jupyter alloc 
    math-alderaan-c17      1           math-alderaan alloc 
    math-alderaan-c18      1     math-alderaan-short idle  
    math-alderaan-c18      1                 jupyter idle  
    math-alderaan-c18      1           math-alderaan idle  
    math-alderaan-c19      1     math-alderaan-short idle  
    math-alderaan-c19      1                 jupyter idle  
    math-alderaan-c19      1           math-alderaan idle  
    math-alderaan-c20      1     math-alderaan-short idle  
    math-alderaan-c20      1                 jupyter idle  
    math-alderaan-c20      1           math-alderaan idle  
    math-alderaan-c21      1     math-alderaan-short alloc 
    math-alderaan-c21      1                 jupyter alloc 
    math-alderaan-c21      1           math-alderaan alloc 
    math-alderaan-c22      1     math-alderaan-short alloc 
    math-alderaan-c22      1                 jupyter alloc 
    math-alderaan-c22      1           math-alderaan alloc 
    math-alderaan-c23      1     math-alderaan-short alloc 
    math-alderaan-c23      1                 jupyter alloc 
    math-alderaan-c23      1           math-alderaan alloc 
    math-alderaan-c24      1     math-alderaan-short alloc 
    math-alderaan-c24      1                 jupyter alloc 
    math-alderaan-c24      1           math-alderaan alloc 
    math-alderaan-c25      1     math-alderaan-short alloc 
    math-alderaan-c25      1                 jupyter alloc 
    math-alderaan-c25      1           math-alderaan alloc 
    math-alderaan-c26      1     math-alderaan-short alloc 
    math-alderaan-c26      1                 jupyter alloc 
    math-alderaan-c26      1           math-alderaan alloc 
    math-alderaan-c27      1     math-alderaan-short alloc 
    math-alderaan-c27      1                 jupyter alloc 
    math-alderaan-c27      1           math-alderaan alloc 
    math-alderaan-c28      1     math-alderaan-short alloc 
    math-alderaan-c28      1                 jupyter alloc 
    math-alderaan-c28      1           math-alderaan alloc 
    math-alderaan-c29      1     math-alderaan-short alloc 
    math-alderaan-c29      1                 jupyter alloc 
    math-alderaan-c29      1           math-alderaan alloc 
    math-alderaan-c30      1             system_test idle  
    math-alderaan-c31      1     math-alderaan-short alloc 
    math-alderaan-c31      1                 jupyter alloc 
    math-alderaan-c31      1           math-alderaan alloc 
    math-alderaan-c32      1     math-alderaan-short alloc 
    math-alderaan-c32      1                 jupyter alloc 
    math-alderaan-c32      1           math-alderaan alloc 
    math-alderaan-h01      1 math-alderaan-gpu-short drain 
    math-alderaan-h01      1       math-alderaan-gpu drain 
    math-alderaan-h02      1 math-alderaan-gpu-short drain 
    math-colibri-i02       1        clas-interactive down* 
    math-score-c01         1              math-score down* 
    math-score-c02         1              math-score down* 
    math-score-c03         1              math-score down* 
    math-score-c04         1              math-score down* 
    math-score-c05         1              math-score down* 
    math-score-i01         1        clas-interactive down* 



It looks confusing but there is a method to the madness in the naming convention. Obviously, math-colibri and math-score are the identifiers for what cluster/building the servers are in, but the –c## and –i## stand for compute and interactive. The c## servers are usually part of the queuing system and **the i## ones are for interactive use and you can ssh there directly**. Again, never ssh to compute nodes directly.

## Submitting Jobs to the Scheduler

### Submitting a job

The <code>sbatch job_script</code> command is used to submit a job into a queue. Your job starts executing in the directory where it was submitted, so submit it from a directory accessible to all compute nodes, such as a subdirectory of your home directory. You can add switches to the <code>sbatch</code> command, but it is recommended to make them a part of your batch script so that you do not have to do that every time. Please do not use more cores than the number of tasks specified in your script.

### Template batch job scripts

The template batch scripts and simple examples to run are available. Get your copy by
    
        git clone https://github.com/ccmucdenver/templates.git 
        
To build the examples, type <code>make</code> in the <code>examples</code> directory. 

**Please do not request the number of nodes on Alderaan by `--nodes` or `-N`, unless you really need entire nodes for some reason. Request only the CPU cores you need by `--ntasks`, then the node or nodes you use can be shared with others.**

### SLURM Directives with Explanations

| Directive             | Explanation                                                  | Options |
| ---------------------- | ------------------------------------------------------------ | ------- |
| `#SBATCH --job-name=`  | Specifies a name for your job.                               | Use whatever naming convention makes sense to you! If you would like a suggestion: `#SBATCH --job-name=job`<br>`#SBATCH --output=job.out`<br>`#SBATCH --error=job.err` |
| `#SBATCH --output=`    | Specifies the file to which standard output (stdout) will be redirected. |  |
| `#SBATCH --error=`     | Specifies the file to which standard error (stderror) will be redirected. |  |
| `#SBATCH --nodes=`     | Specifies the number of nodes requested for the job.         | Please do not request a node unless you know you need the full node’s memory or CPU |
| `#SBATCH --ntasks=`    | Specifies the number of tasks (processes/threads) per node.  | `ntasks` can take a value between 1-64. Recommend: Start small (i.e., 1-5) & if jobs are running out of CPU/memory then increase the value. |
| `#SBATCH --time=`      | Specifies the maximum runtime for the job in the format `days-hours:minutes:seconds`. <br> Examples: <br>1 Day: `#SBATCH --time=1-00:00:00`<br>1 hour: `#SBATCH --time=01:00:00`<br>1 minute: `#SBATCH --time=00:01:00` | Alderaan partitions will run jobs up to one week. If you need more time, use one of the older partitions (score or colibri). |  
| `#SBATCH --partition=` | Specifies the partition or queue where the job will be submitted. | Recommend: Use CPU or GPU Alderaan partitions. <br> CPU nodes, specify: `#SBATCH --partition=math-alderaan`<br>GPU nodes, specify: `#SBATCH --partition=math-alderaan-gpu`<br>Older partitions: `math-score`, `math-colibri` |
| `#SBATCH --array=`     | Specifies an array of job tasks with indices for array job submissions. <br> Examples: <br> `#SBATCH --array=1-5` <br> `#SBATCH --array=0-10,20-21` | You can specify how many array jobs to run at one time with `%`. <br> Example: <br> Run only 3 jobs at one time for 10 jobs: `#SBATCH --array=1-10%3` |

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

###  Multiple single-core jobs using arrays

     #!/bin/bash
     # Multiple single core jobs using array template
     #SBATCH --job-name=mpi_hello_single
     #SBATCH --partition=math-alderaan
     #SBATCH --time=1:00:00                    # Max wall-clock time
     #SBATCH --ntasks=1                        # number of cores, leave at 1
     #SBATCH --array=1-5,10-11                 # specifies to submit this script 7 times where array values are 1, 2, 3, 4, 5, 10, and 11.
     
     examples/hello_world_fortran.exe          # replace by your own executable

SLURM job arrays simplify running multiple instances of the same job script using a single batch script. The above example demonstrates submitting the 'hello_world_fortran.exe' script seven times where array values are 1, 2, 3, 4, 5, 10, and 11.

_Helpful Directives/Variables_:

* %a: add the array number to naming convention. 

        #SBATCH --job-name=mpi_hello_single_%a

* %[insert-number]: Limit the number of array jobs to submit at a time. 

        #SBATCH --array=1-1000%10

    A SLURM array job automatically submits jobs within your allocated resources. If you wish to conserve resources for other tasks, it can be advantageous to control the number of array jobs submitted simultaneously. In the example provided above, a total of 1000 jobs are executed, with 10 jobs running concurrently at any given time. 

* SLURM_ARRAY_TASK_ID: An environment variable that holds the array value. You can use it to pass the array value to the script you intend to execute.

        python example_script.py ${SLURM_ARRAY_TASK_ID}

 
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

The partitions math-alderaan-gpu-short and math-alderaan-gpu have two high memory/GPU nodes`math-alderann-h[01,02]` with two NVIDIA A-100 40GB GPUs and 2TB memory each. Use `--partition=math-alderaan-gpu-short` (1 day job dutation maximum) with `--gres=gpu:a100:1` to request one GPU and `--gres=gpu:a100:2` to request two GPUs. For longer jobs, up to 7 days, you can use `--partition=math-alderaan-gpu`, but node availability may be limited and your job may wait longer.
 
**Please do not use Alderaan GPUs without allocating them by `--gres` as above first. Please do not request an entire node on Alderaan by `--nodes` or `-N`, unless you really need all of it, request only the CPU cores you need by `--ntasks`. Large memory jobs and GPUs jobs can share the same node.**

An example job script:
    #!/bin/bash
    #SBATCH --job-name=gpu
    #SBATCH --gres=gpu:a100:1
    #SBATCH --partition=math-alderaan-gpu
    #SBATCH --time=1:00:00                  # Max wall-clock time 1 day 1 hour
    #SBATCH --ntasks=1                        # number of cores
    singularity exec /storage/singularity/tensorflow.sif python3 yourgpucode.py

Of course, instead of singularity you can run another GPU code on one of the GPU nodes directly. The nodes have currently installed CUDA 11.2. You will have to install tensorflow in your account yourself. A compatible version is [tensorflow 2.4.0] (https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/rel_21-03.html).

It is recommended to use the tensorflow singularity container because it has updated CUDA  (11.4) and a version of tensorflow compatible with the CUDA version.

### Interactive jobs with GPU on Alderaan

From the command line, 

     srun -p math-alderaan-gpu-short --time=2:00:0 -n 1 --gres=gpu:a100:1 --pty bash -i
     
will give you an interactive shell on one of the GPU nodes with one GPU allocated. You can then start singluarity shell

    singularity shell /storage/singularity/tensorflow.sif 

You can also start the Singularity shell directly:

    srun -p math-alderaan-gpu-short--time=2:00:0 -n 1 --gres=gpu:a100:1 singularity shell /storage/singularity/tensorflow.sif
         
will allocate one GPU, one core, and run an internactive sinularity shell.
    
    
## Interactive jobs

Remember you should not directly ssh to a node because it would interfere with jobs scheduled to run on that node. For interactive access to a compute node, do instead:

```
srun -p math-alderaan --time=2:00:0 -n 1 --pty bash -i
```
This will request a session for you as a job in a single core slot on a compute node in the math-alderaan partition for up to 2 hours. After the job starts, your session is transfered to the node. The job will end when you exit or the time runs out. Of course you can do the same for other partitions and add other flags such as to request more cores or a GPU. 

To start an interactive job on Alderaan with a GPU:
```
srun -p math-alderaan-gpu-short--time=2:00:0 -n 1 --gres=gpu:a100:1 --pty bash -i
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

**We will be happy to install software and build containers for you, do not hesitate to ask!** 

## Building Your Own Software

Here are the best practices when you compile and link your own software:

* Use `math-alderaan` head node to build software for use on the Alderaan cluster. Use `module avail` to see which tools are available in [modules](./modules/). We can add other tools and package them in modules on request.

* Alderaan nodes run Centos 8, while Colibri and Score nodes Centos 7. Software built on one will generally not work on the other.

## Linux Introduction  

<ins>Navigating the Linux File System: Basic Commands<ins>

1. pwd - Print Working Directory  

The pwd command displays the current working directory, which is your current location in the file system. 

    pwd 

2. ls - List Files and Directories  

The ls command lists the files and directories in the current directory. 

    ls 
    ls -l         # list more information about files and directories 

3. cd - Change Directory  

The cd command is used to navigate to a different directory. 

    cd /path/to/directory 
    cd ..        # Move to the parent directory 
    cd ../ 	     # Move up one directory 
    cd ~         # Move to the user's home directory 
    cd /         # Move to the root directory 
 
4. mkdir - Make Directory  

The mkdir command is used to create a new directory. 

    mkdir new_directory         # Create a new directory called new_directory
 
5. cp - Copy Files and Directories  

The cp command is used to copy files or directories from one location to another. 

    cp file.txt /path/to/destination/	          # Copy a file  
    cp -r directory /path/to/destination/             # Copy a directory and its contents 
 
6. mv - Move or Rename Files and Directories  

The mv command is used to move files or directories to a new location or rename them. 

    mv file.txt new_location/		       # Move a file to a new location 
    mv old_name.txt new_name.txt		       # Rename file 

7. rm - Remove Files and Directories The rm command is used to remove files or directories. 
```
rm file.txt	         # Remove a file 
rm -r directory          # Remove a directory and its contents 
```

8. nano - Create File  

The nano command is used to create an empty file. 

    nano new_file.txt 
 
* 'Crtl' + 'o' : save file
* 'Crtl' + 'x' : exit editor

10. cat - Display File Content  

The cat command is used to display the contents of a file. 

    cat file.txt 
 
11. echo - Print Text to the Terminal or File  

The echo command is used to print text to the terminal or write it to a file. 

    echo "Hello, world!"                     # Print "Hello, world!" to the terminal 
    echo "Hello, Linux" > greeting.txt       # Print "Hello, world!" and save in file greeting.txt
