# Introduction

## What is a cluster?

Cluster is a collection of (usually Linux) computers connected by a high-speed private network. 
Only a designated computer, the **head node**, is accessible from the outside. 
Other nodes, called **compute nodes** are connected to
the outside through the head node. You do not work on the compute nodes directly, but submit your work through a **batch scheduler**,
which is a program that distributes the work between the compute nodes. 
Cluster can have also **storage nodes**, which specialize in storing files. Normally you see 
the same files on all nodes.

## How do I work on a cluster?

You ssh into the head node, which will start a command line (also called shell) session for you.
Then prepare your computation as a text file called a **batch script**. The batch script 
contains the commands you want to execute and special comments, 
where you tell the scheduler what kind of resources the job needs - the number of nodes and cores to use,
the queue you want to use, the maximum time the job is allowed to take, and more. 

Then you submit your batch script to the scheduler, which will try to find nodes with available resources you
asked for, and, when successful, starts executing the batch script there. If the resources are not available
at the moment, your job will wait in a queue. Your job will run in the directory where it was submitted,
which is also the default location for any files the job may create. After the job ends, 
the scheduler will deposit the output from the batch script in the directory also.

The head node is not as poweful as the compute nodes, and it is often used by many people logged in at the 
same time. To keep the head node usable for everyone, you should use it only for light work, such as 
editing files, compilation of code, and small tests. 
You should do computationally intensive interactive work only on compute nodes in an **interactive batch job**. 
Here is how: use a special command to have the scheduler transfer you into a new command line session which runs 
as a job on a compute node. When you exit the session on the compute node, the job will end and you are
back in your session on the head node.

You should not work on compute nodes directly, because you would use resources the scheduler has not
allocated to you, which will interfere with the jobs run through the scheduler. 
It is OK to log into a compute node to check on  your jobs what processes they run and how 
much memory and CPU they are using. 

## What can I do with this?  

The simplest way to use a cluster is to run a code using a **single core job** from a batch script. 
A program you write, e.g., in Python of C, will be like that unless you do something special. Some users run
a large number of single code jobs to do many independent computations quickly, such as explore
different parameters of a model or process many datatsets in parallel. This way of using clusters is called 
**High Throughput Computing (HTC)**.

When you write your code as a script in a package like MATLAB or R, the package will often try to use
multiple cores to run faster, sometimes without you even knowing. You should then find out (e.g. from
documentation or by experiments) how many cores your job needs and specify in your job enough
cores on a single node. Your code will run faster and everyone will be happier.

You can also write your own codes with multitasking, e.g. in Python, or in C/C++/Fortran using a library like 
OpenMP. Again, you should ask in your batch job script for the number of cores you will need, 
specify a single node, and make sure your code is not trying to use more cores than you asked for.

Finally, where clusters really shine is using many nodes at once as a single large computer. This is called 
**High Performance Computing (HPC)** and it is the reason why many clusters have an additional expensive
very high-speed network, called **interconnect**.  The 
[fastest supercomputers in the world](https://top500.org) are built this way. A common use of HPC is to for
engineering and scientific simulation, such as in solid or fluid mechanics, plasma physics, or weather
forecasting. The problem is discretized on a grid, which is partitioned into a large number of pieces. 
Each piece of the grid is assigned to one core, and the cores communicate
the values on their boundaries between each other through the high speed interconnect using a library such as
the [Message Passing Interface (MPI)](https://en.wikipedia.org/wiki/Message_Passing_Interface).

## Software environment

Jobs can be assigned anywhere on the cluser, therefore the software presented to jobs on the
nodes should be identical. The software on the head node
should be also the same. But different uses require different software packages installed, and it is not
possible to just install everything because software packages and their dependencies 
often conflict with each other. 
This issue is resolved in two ways: runing jobs in Singulariy containers, which 
carry inside a complete software environment (including a version of the operating system) for a particular
application, and by selecting software to become accessible to a user through **environment modules**.

## What is the configuration of our cluster?

Our cluster is actually a collection of three clusters: Alderaan, a new cluster with over 2000 cores, 
2 high-end GPUs, and a high-speed InfiniBand interconnect; Score, a smaller cluster built specifically for
long-running single-core jobs; and Colibri, an older cluster with GPUs. The three clusters are accessed
as different **queues** on the same scheduler, called **SLURM**. The cluster has two head nodes,
**math-alderaan** and **clas-compute**. You can submit jobs from either.

We provide singularity containers for many uses and we can build more on request. The containers can run in any
of the queues, with exceptions noted when the software in the container requires hardware a particular queue
does not provide. Aderaan has also software which comes as modules. Specific modules need to be loaded
before the software they provide can be used.
