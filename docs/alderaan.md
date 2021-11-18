# Alderaan cluster

## Funding
This cluster is funded by [NSF grant 2019089 CC* Compute: Accelerating Science and Education by Campus and Grid Computing](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2019089)  under the [NSF CC* program](https://www.nsf.gov/publications/pub_summ.jsp?ods_key=nsf20507). The cluster will be integrated with the [Open_Science_Grid (OSG)](https://opensciencegrid.org). At least 20% of capacity will be contributed to the OSG as required by the program.

## Hardware
* 2048 AMD EPYC 2 cores and 4TB DDR4 memory in 32 compute nodes. Each node has 2 32-core CPUs for a total of 64 cores, and 512GB memory.
* 128 AMD EPYC 2 cores, 2 NVIDIA Tesla A100 and 4TB DDR4 memory in 2 high-memory GPU nodes, each with 2TB memory, 64 cores, and one GPU.
* Head node with 64 AMD EPYC 2 cores and 512GB memory.
* 1PB storage (raw)
* HDR100 Infiniband interconnect
* 10Gb/s ethernet connectivity path from each node to Internet 2

## Software
* scheduler, cluster tools, GNU compiler stack with MPI over Infiniband
* CUDA for GPUs
* shared filesystem over Infiniband

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

## User training (after the configuration is complete)
* ssh command line usage
* submission of OSG jobs
* web access to the cluster

Contact: jan.mandel@ucdenver.edu

