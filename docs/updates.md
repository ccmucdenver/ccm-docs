# News and Status Updates

Please contact jan.mandel@ucdenver.edu with any questions.

Reload the page to see the latest information. Your browser may be caching an old version.

Real-time:  &nbsp;  &nbsp; [Temperature](https://demo.openwfm.org/web/alderaan/temp.txt) &nbsp; &nbsp; [CPU load](https://demo.openwfm.org/web/alderaan/cpu.txt) &nbsp; &nbsp; [Memory](https://demo.openwfm.org/web/alderaan/mem.txt) &nbsp; &nbsp; [Swap](https://demo.openwfm.org/web/alderaan/swp.txt) &nbsp; &nbsp; [Partitions](https://demo.openwfm.org/web/alderaan/sinfo.txt)

### 2022/06/13

* Node math-alderaan-h01 will be powered off Monday afternoon to add a second GPU. All running jobs will be killed. The node will be put in draining state in 
advance so that no new jobs can start. Node math-alderann-h02 will be put  back, upgraded to two GPUs. Other nodes should not be affected.

* SLURM reconfiguration to allocate also GPUs and memory at least in the math-aldreraan-gpu partition is coming soon.

* Forwarded from XSEDE: Texas A&M University **FASTER** (Fostering Accelerated Scientific Transformations, Education, and Research) is a novel composable high-performance data-analysis and computing instrument funded by the NSF MRI program. **FASTER** adopts the innovative Liqid composable software-hardware approach combined with cutting-edge technologies such as Intel Ice Lake CPUs, NVIDIA A100/A40/A30/A10/T4 GPUs, NVMe based storage, and high-speed Infiniband HDR interconnect. **FASTER** is a 184-node cluster built by Dell and has 40 A100, 200 T4, 8 A40, 8 A10, and 4 A30 GPUs. Each compute node can compose multiple GPUs of various types via Liqid PCIe fabrics. The **FASTER** platform removes significant bottlenecks in research computing by leveraging composable technology that can dynamically integrate disaggregated GPUs to a single node, allowing HPC/AI workflows to flexibly choose the type and number of GPUs to fit their needs. Thirty percent of **FASTER’s** computing resources are allocated to researchers nationwide by XSEDE/ACCESS program. **FASTER** is open as friendly user mode to XSEDE Startup allocations now and invites researchers who are interested in becoming **FASTER** users to submit allocation requests.  More details about **FASTER** can be found: https://portal.xsede.org/tamu-faster


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

