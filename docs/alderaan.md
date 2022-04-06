# Alderaan Cluster

## Funding
This cluster is funded by [NSF grant 2019089 CC* Compute: Accelerating Science and Education by Campus and Grid Computing](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2019089)  under the [NSF CC* program](https://www.nsf.gov/publications/pub_summ.jsp?ods_key=nsf20507). The cluster will be integrated with the [Open_Science_Grid (OSG)](https://opensciencegrid.org). At least 20% of capacity will be contributed to the OSG as required by the program.

## Purpose
The Alderaan cluster is a resource for both campuses of the University of Colorado Denver. It is shared cluster running multi-core jobs with multiple nodes using MPI and the high-speed interconnect (High-Performace Computing, HPC), as well as multiple single-core jobs (High-Throughput Computing, HTC). All jobs need to be limited in duration. Long-running single-core jobs should be submitted to [Score cluster](../score/) nodes. 

Work consisting of a very large number of single-core jobs can be also submitted to the [Open Science Grid (OSG)](https://opensciencegrid.org) - log into https://osgconnect.net with your CU Denver credentials, make an account, and contact us for help.

## Hardware
* 2048 AMD cores and 16TB memory in 32 compute nodes. Each node has 2 AMD EPYC 7502 32 core processors for a total of 64 cores, 512GB DDR4 memory, and dual 960GB SSD. The compute nodes are in 8 1U rack-mount drawers, with 4 nodes in each drawer.
* 2 high-memory GPU nodes, each with 2 AMD EPYC 7502 32 core processors, NVIDIA Tesla A100, and 2TB DDR4 memory.
* Head node with 2 AMD EPYC 7502 32 core processors and 256GB memory.
* 816TB storage (1PB raw), in 2 storage nodes, each with 2 Intel Xeon( Gold 5215 CPUs  2.50GHz, 196GB memory, and XFS filesystems shared by NFS over Infiniband.
* HDR100 Infiniband interconnect
* 10Gb/s ethernet connectivity path from each node to Internet 2

The cluster was built by [Atipa](https://www.atipa.com) in 2021.

## Software
* SLURM cheduler, cluster tools, GNU compiler stack with MPI over Infiniband
* CUDA for GPUs

## Progress
### Fall semester 2020
* Purchase order 
* Planning
* Advance testing of software
### Spring semester 2021
* Delivery and installation 
* Testing with the vendor's software configuration
### Fall semester 2021
* Finalize networking, access, and security
* Open to early users
* Install user web interface - Remote desktop, JupyterHub
* Install OSG - run OSG jobs and submit jobs to OSG
* Set up governance and allocation processes
### Spring semester 2022
* Scaling up availability and user base

## User Training (after the configuration is finalized)
* ssh command line usage
* submission of OSG jobs
* web access to the cluster

## How to Use

Authorized users can submit jobs on the Alderaan cluster on the head node or the [common cluster scheduler](../clusters_guide). The head node is accessed by ssh to math-alderaan.ucdenver.pvt. The head node is for compilation and small tests only. Please do not run any intensive or long jobs on the head node.

An allocation system is set up and will be activated when warranted by the cluster load.

Graphical desktop and Jupyterhub front end interfaces are coming soon.

## Contact
jan.mandel@ucdenver.edu

