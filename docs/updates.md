# News and Status Updates

Please contact jan.mandel@ucdenver.edu with any questions.

Reload the page to see the latest information. Your browser may be caching an old version.

Real-time  &nbsp;  &nbsp; [Room temperature](https://demo.openwfm.org/web/alderaan/temp.txt) &nbsp; &nbsp; [CPU temperature](https://demo.openwfm.org/web/alderaan/cpu_temp.txt)  &nbsp; &nbsp; [CPU load](https://demo.openwfm.org/web/alderaan/cpu.txt) &nbsp; &nbsp; [Memory](https://demo.openwfm.org/web/alderaan/mem.txt) &nbsp; &nbsp; [Swap](https://demo.openwfm.org/web/alderaan/swp.txt) &nbsp; &nbsp; [Partitions](https://demo.openwfm.org/web/alderaan/sinfo.txt)


**To protect the computer hardware, jobs running on Alderaan CPUs which get too hot are 
suspended automatically. The jobs resume after the temperature drops, which 
should not take more than few minutes.**
Please see [CPU temperature](https://demo.openwfm.org/web/alderaan/cpu_temp.txt) for details.

### 2022/07/15 

* The high-memory/GPU nodes are math-alderaan-h[01-02] are back in operation.

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

