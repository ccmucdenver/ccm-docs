# Score Cluster

## Funding
This cluster was purchased in 2019 from CCM budget. 
## Purpose
The Score cluster is suitable for long-running single-core jobs.
## Hardware

5 compute nodes math-score-c[01-05] Dell R720, each dual E5-2670v2s (2.5Ghz 10 cores each), 192GB DDR3 RAM, total 100 cores and 960GB memory.
  Ethernet interconnect 10Gbit.
  
The interactive node math-score-i01 has dual E5-2640v2 CPU and 128GB RAM. 

## How to Use
Jobs for the Score cluster compute nodes should be submitted to the [math-score](../clusters_guide) partition. 
You can also use `math-score-i01` interactively by ssh.
Score nodes do not mount Alderaan filesystems, so it does not have access to modules and the /data001 and /data002 filesystems. Please use singularity containers for custom software environments. 


