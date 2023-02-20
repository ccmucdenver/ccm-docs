# News and Status Updates

Please contact jan.mandel@ucdenver.edu with any questions.

Reload the page to see the latest information. Your browser may be caching an old version.

Real-time &nbsp; [Alderaan Temperature Log](https://demo.openwfm.org/web/alderaan/temp.txt) &nbsp; &nbsp;
 [Status](https://demo.openwfm.org/web/alderaan/cpu_temp.txt) &nbsp; &nbsp;
 [CPU Load](https://demo.openwfm.org/web/alderaan/cpu.txt) &nbsp; &nbsp;
 [Memory](https://demo.openwfm.org/web/alderaan/mem.txt) &nbsp; &nbsp;
 [Swap](https://demo.openwfm.org/web/alderaan/swp.txt) &nbsp; &nbsp; 
 [Partitions](https://demo.openwfm.org/web/alderaan/sinfo.txt)


**To protect the computer hardware, should Alderaan CPUs get too hot, the jobs running on them are 
suspended automatically. This should happen only rarely now. The jobs resume after the temperature drops, which 
should not take more than few minutes.**
Please see [CPU temperature](https://demo.openwfm.org/web/alderaan/cpu_temp.txt) for details.

### 2023/02/18

* Front end math-alderaan is down. 
The Alderaan cluster is accessible through the alternate front end by

     ssh clas-compute.ucdenver.pvt 

* Slurm and all compute nodes are working normally.

* Modules and custom software installed in /shared are not available. 
Other filesystems are not affected.

* System monitoring is not being updated.

* Note that some project directories and the /scratch directory are in /data001 and /data002 filesystems, which are not accessible from clas-compute head node, colibri cluster, and the score cluster.

### 2023/02/10

* math-alderaan-h02 is available

### 2023/02/08

* Taking math-alderaan-h02 down for diagnostics/repair
* math-alderaan-c[01-04] are back

### 2023/02/03

* Node math-alderaan-h02 in drain state for GPU diagnostics, please do not use
* 10:40pm: Node math-alderaan-h02 available 

### 2023/01/23

* [Hands-on workshop](../training/)

### 2022/12/07

* Nodes math-alderaan-c[01-04] are with the vendor for repair.

### 2022/12/06

* Nodes math-alderaan-c[02-04] are draining. They will be powered off tomorrow at 2pm and any jobs on them killed. The chassis with nodes math-alderaan-c[01-04] needs to be sent to the vendor for repairs.
 
### 2022/12/04

* Node math-alderaan-c01 still down until further notice

* 1pm sbatch error resolved, operations normal.

* 11pm Users unable to submit slurm jobs, error "sbatch: error: Batch job submission failed: Invalid account or account/partition combination specified"

### 2022/12/03

* 11pm The filesystem mounts on math-alderaan and several compute nodes were found to be dropped. This was causing problems including users not being able to login, access files, submit jobs, as well as issues with jobs already running. The filesystems were mounted again.

* Data center power outage 7pm-9pm

### 2022/11/23

* Node math-alderaan-c01 is down. Investigating.

### 2022/11/14

* Jobs submitted by sbatch or srun may not be starting properly for some users intermitently, possibly due to authentication or network issues. Investigating. Please let me know at jan.mandel@ucdenver.edu if you see this happen.

### 2022/11/04

* The `/storage/singularity/mixtures.sif`container was updated and several packages added. The old container is at `/storage/singularity/archive/mixtures-nov2-2022.sif`
* All operations are normal.

### 2022/09/24

* Partition /storage/math/projects partition back under 50% utilization. All operations normal.

### 2022/09/23

* 10am The 40TB /storage/math/projects partition is 100% full. Until this is corrected no one can add any files there. Moving the largest user directories to /scratch and contacting the users individually. The /scratch directory is accessible from all alderaan nodes but not /colibri or /score.

* 4pm /storage/math/projects is at 96%. Please do not put any large new files there, make a directory in /scratch instead.

### 2022/09/14

*  Node math-alderaan-c01 is back. All operations normal.

### 2022/09/13

*  Node math-alderaan-c01 is down.

### 2022/09/12

*  All Colibri nodes are now available. The cause was a power issue in a network switch.

### 2022/09/05

* 5pm [Large scale network outage at CU Denver](https://stspg.io/cm2wj5ff4k89), clusters not accessible. Last Alderaan updates are from 4:31pm. The cause is a power outage.

* 11:58pm OIT restored the power. All running jobs were killed by the power interruption. All alderaan nodes were reset and are now back. Colibri nodes continue to be not accessible.

### 2022/09/04  

* Node math-alderaan-c01 is down. I'll work on it after the Labor Day weekend.

### 2022/09/02  

* All Colibri compute nodes math-colibri-c[01-24] and also math-colibri-i01 are not accessible. No ETA at this point. Please let me know if you need those nodes urgently. The large memory interactive node math-colibri-i02 works normally.

### 2022/08/18

* NetCDF C and Fortran libraries rebuilt with the updated Intel compiler 2022.1.0. `module load intel` and `module load netcdf` will automatically select the latest versions. Please do `module purge` to start clean when loading  modules and assure a predictable environment.

### 2022/08/16

* Software maintenance planned on math-alderaan-h[01-02] is postponed. Please continue using the existing GPU directions in the [Clusters guide](../clusters_guide/#how-to-run-with-gpu-on-alderaan).

### 2022/08/15

* 4pm Node math-alderaan-c01 is back, all nodes operational.

* Hardware maintenance on math-alderaan-c01 and several other compute nodes from about 1pm. The nodes will be put in drain state in advance. Nodes suspended for CPU overheating will be included and not resumed automatically.  Other Alderaan nodes should not be affected but connectivity may be limited temporarily.

### 2022/08/11

* Node math-alderaan-c01 is down.

### 2022/08/08

* Intel BaseKit and HPCKit (compilers, debugger, libraries) updated to current version. Do <code>module avail</code> to see what is there.
 
### 2022/08/06

* Nodes math-alderaan-h[01-02] are draining to prepare for scheduled maintenance. 

### 2022/08/04

* 5pm: Maintenance completed, operations normal. 

* 10am: Maintenance started: continue moving nodes and cables improve air flow and adding fan strips.  Nodes math-alderann-c[01-12] will be powered off. Other nodes and functionality may be affected too.

* 12am: Nodes math-alderaan-c[01-12] are draining, no new jobs can start on them. Existing jobs can continue while the nodes remain up. Any nodes suspended automatically for CPU overheating will remain suspended until the maintenance is completed.

### 2022/08/02

* Maintenance (rack reconfiguration to improve cooling) is scheduled to continue 8/4 with nodes math-alderaan-c[01-12], which will be down. Other nodes may be affected for shorter periods.

* 8pm: Planned hardware maintenance completed. All alderaan nodes work normally. Please let me know if you see any issues.

* 9am: Planned maintenance in progress. Alderaan not available.

### 2022/07/31

* Nodes math-alderaan-c[29-32] fixed, math-alderaan-c[13-26,28] still offline.
  Slurm and temperature monitoring work with all available nodes normally,
  and the nodes can be used at full load. 

### 2022/07/30

* Nodes math-alderaan-c[13-26] and math-alderaan-c[28-32] are offline. 
  The slurm scheduler works with the remaining nodes normally. 
  Temperature monitoring works normally.

* Maintenance is scheduled to continue Tuesday 8/2/2022. 

### 2022/07/29 

* Maintenance of nodes math-alderaan-c[13-32] to improve cooling is planned for Friday 7/29 9am-3pm. 

* Please continue to run jobs, just know that they may be interrupted for maintenance. The downtime of individual nodes will be kept to a minimum possible. 

### 2022/07/28

* In preparation for maintenance on 7/29, nodes math-alderaan-c[13-32] are draining. The nodes will be resumed one by one as soon as possible.

* Thermal management was modified temporarily so that it does not resume suspended nodes (and jobs on them) automatically. Since the ambient temperature is low enough for nothing to get suspended, this is not expected to make a difference

### 2022/07/27

* Reconfiguration of slurm to recognize GPUs as a resource in progress. Please let me know should you see any unusual behavior. 

* The data center temperature is lower now. Job should not be getting suspended because of temperature any more, or only rarely.

* The cause of the downtime of math-alderaan-c[29-32] was found and it should be corrected by the end of the day Friday 7/29.

### 2022/07/21

* Node math-alderaan-c01 is back online. Nodes math-alderaan-c[29-32] are down, investigating. No jobs were cancelled.

* The [TDP](https://community.amd.com/t5/processors/what-do-amd-mean-by-tdp/td-p/221727) on math-alderaan-c01 and math-alderaan-c07 was changed. 
Their availability will be limited until testing is completed. 

### 2022/07/18

* Node math-alderaan-c01 is down.

### 2022/07/15 

* The high-memory/GPU nodes math-alderaan-h[01-02] are back in operation.

### 2022/07/14 

* The high memory/GPU nodes are down. Investigating.

* One way to avoid getting jobs suspended is to use fewer cores per node. Since the CPU turbo 
boost feature will speed up the remaining cores and the load depends on application, 
the number of cores per node to use is best determined by trial and error. 

### 2022/07/12

* To protect the computer hardware, jobs running on CPUs which get too hot are 
suspended automatically. The jobs resume after the temperature drops.

* We also increase the speed of 
the node fans proactively as the CPU temperatures increase.


### 2022/07/09

* Cooling and temperature monitoring were improved. **All Alderaan nodes can be used at 100% 
load safely.** 

* Should a [CPU temperature](https://demo.openwfm.org/web/alderaan/cpu_temp.txt)  exceed
a limit, the jobs using the CPU will be suspended automatically and  can be resumed later 
after a review of the situation. The node state will show as `drng` in the 
[partitions list](https://demo.openwfm.org/web/alderaan/sinfo.txt).

[//]: # (Reducing  the number of cores used has some effect on the CPU heat generated, but only a limited one because the remaining cores can boost their speed up.)

* A link to real-time CPU temperature on all Alderaan nodes was added above.

### 2022/07/08

* 1:15pm: Normal operations resumed. 

* 12:30pm: A/C offline, operations suspended.

* 11:00am: Data center was improved. Nodes math-alderaan-c[01-32] resumed. Please do go ahead and submit your jobs and use all  nodes at 100% again.

### 2022/07/07

* Because of CPU overhearing, no new jobs can start on nodes math-alderaan-c[01-32] and existing jobs on nodes loaded more than 80% were killed or suspended.
Arrangements to use the nodes at reduced load are possible while the heat situation is being resolved, please contact jan.mandel@ucdenver.edu.

* Node math-alderaan-c01 reset and returned to operations. 

### 2022/07/03

* Node math-alderaan-c01 failed and won't power on.

### 2022/06/21
* Thanks to all who submitted their contributions for the annual report for the [NSF grant](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2019089) Alderaan is funded from!

* New modules available on Alderaan: module load intel will set up the Intel compiters and MPI; module load netcdf will point environment variable NETCDF to both C and Fortran NetCDF as expected by many software packages. Separate modules netcdf-c and netcdf-fortran are also available. All NetCDF modules are built with the Intel compilers.

### 2022/06/14 

* Slurm configuration with GPUs and memory as controlled resources is coming soon. In the meantime, **please do not request an entire high memory/GPU node if you do not need all the resources, request only the cores you need**.

* 1pm: Maintenance completed. Nodes math-alderaan-h01 and math-alderaan-h02 have two GPUS each now. Operations normal.

* 11am: Maintenance started, taking node math-alderaan-h01 offline.

### 2022/06/13

* The maintenance on math-alderaan-h01 and the return of math-alderaan-h02 are postponed to tomorrow 6/14 11am.

### 2022/06/12

* All jobs will be now suspended automatically when alderaan inlet temperature reaches 29 C to help prevent a data center overheating emergency.
Normal operations will resume when the temperature returns to at most 25 C. Please check the temperature log above if your jobs are suspended or submitted jobs do not start.

### 2022/06/11

* 9:40pm Temperature back to normal 25C, all jobs resumed, normal operations resumed. 

* 5pm Datacenter temperature 30C. All alderaan jobs suspended an no new jobs can start to help prevent overheating.

### 2022/06/10

* Node math-alderaan-h01 will be powered off Monday 6/13 afternoon to add a second GPU. All running jobs will be killed. The node will be put in draining state in 
advance so that no new jobs can start. Node math-alderann-h02 will be put  back, upgraded to two GPUs. Other nodes should not be affected.

* SLURM reconfiguration to allocate also GPUs and memory at least in the math-alderaan-gpu partition is coming soon.

* Forwarded from XSEDE: Texas A&M University **FASTER** (Fostering Accelerated Scientific Transformations, Education, and Research) is a novel composable high-performance data-analysis and computing instrument funded by the NSF MRI program. **FASTER** adopts the innovative Liqid composable software-hardware approach combined with cutting-edge technologies such as Intel Ice Lake CPUs, NVIDIA A100/A40/A30/A10/T4 GPUs, NVMe based storage, and high-speed Infiniband HDR interconnect. **FASTER** is a 184-node cluster built by Dell and has 40 A100, 200 T4, 8 A40, 8 A10, and 4 A30 GPUs. Each compute node can compose multiple GPUs of various types via Liqid PCIe fabrics. The **FASTER** platform removes significant bottlenecks in research computing by leveraging composable technology that can dynamically integrate disaggregated GPUs to a single node, allowing HPC/AI workflows to flexibly choose the type and number of GPUs to fit their needs. Thirty percent of **FASTER’s** computing resources are allocated to researchers nationwide by XSEDE/ACCESS program. **FASTER** is open as friendly user mode to XSEDE Startup allocations now and invites researchers who are interested in becoming **FASTER** users to submit allocation requests.  More details about **FASTER** can be found: [https://portal.xsede.org/tamu-faster](https://portal.xsede.org/tamu-faster)


### 2022/06/03

* NEW: Real-time system status added to this updates page, check out the links above.

### 2022/06/02

* 2pm: Power redistribution and testing completed without tripping any breakers. Normal operations resumed. All existing jobs continued normally. All nodes available except math-alderaan-h02 out for maintenance.

* 11am: All nodes draining. Power reconfiguration and testing are scheduled to start at 1pm. Existing jobs should be able to continue unless a power load test trips circuit breakers.

### 2022/05/28

* All clusters operate normally. All nodes showing as available can be used at full load. 

### 2022/05/27 

* Work on power distribution was completed for the day about 1pm. No jobs were cancelled. Nodes math-alderaan-c[01,05,09,13,17,21,25,29] are offline to reduce the maximum load and avoid potential shutdown over the weekend.  The rest operates normally.

* Node math-alderaan-c18 had a memory board replaced and it is back online. Node math-alderaan-h02 is out for maintenance until further notice. 

### 2022/05/26

* Work on power distribution and stress testing was completed about 2pm for today and all clusters are available.

* Nodes math-alderaan-c18 and math-alderaan-h02 are down for repair until further notice.

* Alderaan will be down 2022/05/27 from about 10:30am to continue work on power distribution. The clas-compute front end, the score cluster, and the colibri cluster should not be affected.

* Announcements switched from emails to this page, announced in login message on front ends. 

