# Introduction

## What is a cluster?

Cluster is a collection of (usually Linux) computers connected by a high-speed private network. 
Only a~designated computer, the **head node**, is accessible from the outside. 
Other nodes, called **compute nodes** are connected to
the outside through the head node. You do not work on the compute nodes directly, but submit your work through a **batch scheduler**,
which is a program that distributes the work between the compute nodes. 
Cluster can have also **storage nodes**, which are computers that specialize in storing files. Normally you see 
the same files on all nodes.

## How do I work on a cluster?

To work in a cluster, you ssh into the head node, which will start a command line session for you.
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
The way it works is, you use a special command to have the scheduler reserve resources on a compute node
and start a command line session there. When youi exit the session, you are back on the head node.

You should not work on compute nodes directly, because you would use resources the scheduler has not
allocated to you, which will interfere with the jobs run through the scheduler. 
It is OK to log into a compute node to check on  your jobs what processes they run and how 
much memory and CPU they are using. 

## What can I do with this?  



## What is the configuration of 
