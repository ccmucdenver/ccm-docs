# Updates

Please **contact Alderaan Help from your CU Denver email** with any questions.

Alderaan is a High Performance Computing (HPC) facility that employs active, software-controlled thermal management to ensure reliable operation within available power and cooling constraints.

When CPU temperatures approach defined thresholds, site-specific controls may temporarily reduce CPU performance to prevent hardware-level throttling. When storage components experience elevated temperatures, jobs may be briefly suspended to allow I/O activity to settle and to protect the storage systems. If datacenter environmental limits are exceeded, Alderaan may be shut down automatically as a protective measure.

### 2026/01/30

* **9:00–10:00 AM scheduled maintenance** for a network uplink change.
   * Network connectivity to Alderaan is expected to be interrupted for about 10 minutes.
   * SSH login and Jupyterhub will be unavailable during the interruption.
   * Existing SSH and JupyterHub connections may disconnect. You may need to refresh your browser or reconnect after the maintenance.
   * Running batch jobs and existing Jupyter servers are expected to continue, but jobs that rely on network access or external services, such as license servers or data acquisition, may be affected.
   * Please avoid starting interactive or time-critical work during this window.

### 2026/01/07

* 11:16 MT Alderaan is unreachable. Investigating.
  * Impact: Login unavailable. Slurm jobs not affected. Outgoing connections (licenses, downloads, etc.) time out.
* 15:20 MT Connectivity reestablished.
* Cause: Upstream campus network issue.

### 2025/12/29

* Rolling Slurm configuration update in progress to correct a node Slurm configuration issue which may have caused jobs getting cancelled and nodes going in  DRAINING/DRAIN status in some cases.
* Cluster was drained. This does not affect running jobs, but no new jobs can start. Updated Slurm configuration was activated on the head node controller and idle nodes only to avoid disturbing running jobs, and nodes resumed. Other nodes will be updated and resume incrementally as running jobs complete. This may take up to 7 days.

### 2025/12/26 

* The cluster Slurm scheduler configuration was updated to ensure that allocated memory is available to jobs.
    * Jobs will no longer be scheduled on the same node if sufficient unallocated memory is not available.
    * This prevents memory oversubscription and unexpected job terminations due to out-of-memory conditions.
    * As a result, some jobs that previously started immediately may now remain pending longer if their requested memory cannot be satisfied.
 * This change affects only jobs waiting in the queues. It is in effect immediately.

### 2025/12/24

* Rolling update in progress to improve Slurm behavior when jobs exceed memory allocations under shared-node cgroup enforcement and reduce nodes going in DRAINING/DRAIN state.
    * Jobs are no longer allowed to use more memory than allocated. This should help prevent delayed exit, which was causing nodes to enter DRAINING/DRAIN state. **This may result in jobs running out of memory while they were previously allowed to continue. Increase the memory requested by the job when that happens.**
    * Slurm waits on job termination for 300s rather than previous 60s. This may result in jobs staying in exiting state longer.
* Cluster was drained. This does not affect running jobs, but no new jobs can start. Updated Slurm configuration activated on idle nodes only to avoid disturbing running jobs, and nodes resumed. Other nodes will be updated and resume incrementally as running jobs complete. This may take up to 7 days.

### 2025/12/19

* Update of Slurm cgroups configuration on all nodes completed.

### 2025/12/13
* Updating Slurm cgroups configuration to get rid of the HWLOC Affinity warning. All nodes were put to draining state. When jobs running on a node have ended, Slurm daemons on the node are restarted and the node gets returned to operations. No jobs are getting cancelled.

### 2025/12/12
* Adding to docs new section [Apache Spark](../spark/) how to run Spark on a single node.

### 2025/11/04

* Node **math-alderaan-h02** was upgraded to CUDA 12.9 and returned to operations.
* Both GPU nodes **math-alderaan-h01** and  **math-alderaan-h02** now run CUDA 12.9 and are in the partititions **math-alderaan-gpu** (7 days max, lower priority) and **math-alderaan-gpu-short** (1 day max, higher priority). Partition **math-alderaan-cuda12** is set to Down for limited time for continuity and will be deleted.
* Singularity containers with CUDA 11 should still work using **singularity exec --nv**.
* TensorFlow is currently not compatible yet with CUDA 12.9. New singularity container **cuda12.2-tf.sif** with CUDA 12.2, TensorFlow 2.16, and conda is available and will run with the upgraded CUDA drivers. Use as
  ```
     singularity exec  --nv /storage/singularity/cuda12.2-tf.sif your_script
  ```
* You can use **singularity shell  --nv /storage/singularity/cuda12.2-tf.sif** to create your own conda environments.
  
### 2025/11/03

* Node math-alderaan-h02 is down for CUDA drivers upgrade

### 2025/08/17

* Operations normal.
  
### 2025/08/16

* Due to datacenter overheating:
    * All partitions are down and no new jobs can start.
    * All running jobs are suspended, nodes running idle.
    * All nodes without jobs on them are powered off.
 
### 2025/08/15

* Datacenter maintenance completed, Alderaan available

* The long-runtime GPU partition remains down to facilitate the upcoming CUDA upgrade on math-alderaan-h02 and to support shared use of GPU nodes.
Please use these partitions with a 1 day run time limit:
   * math-alderaan-gpu-short
   * math-alderaan-cuda12

### 2025/08/12

* **Alderaan Power reduction during datacenter maintenance** (Aug 13–15)

* **Window:** Wed Aug 13–Fri Aug 15

* **Policy in effect until maintenance completes:**

    * Jobs with requested runtime > 1 day **will not start**.
    * Most nodes are draining or powered off.
    * Limited capacity remains in `math-alderaan-short` and `math-alderaan-gpu-short` partitions.
    * Jupyter service remains available.
    * Do not submit large job bursts. **Users queuing excessive jobs may have SLURM priority reduced to preserve fairness**.

* **Notes:**

* Expect longer queue times.
* Check node/queue status with `sinfo` and job status with `squeue`.
* Requeue or shorten jobs if possible to fit within the 1‑day limit.

* **We will announce when normal scheduling resumes.**

### 2025/08/01 
* New singularity container **cuda12.2-tf.sif** with CUDA 12.2, TensorFlow 2.16, and conda is available. Use as
  ```
     singularity exec  --nv /storage/singularity/cuda12.2-tf.sif your_script
  ```
* Node **math-alderaan-h01** with CUDA 12.9 remains available in partition **math-alderaan-gpu-cuda12**, with maximum runtime 1 day.
* Node **math-alderaan-h02** remains available in partition **math-alderaan-gpu-short**, maximum runtime 1 day.
* Partition **math-alderaan-gpu** with 7 days runtime remains down until the transition to CUDA 12 is complete.

### 2025/07/30
* **Corrected** Node **math-alderaan-h01** was upgraded to CUDA 12.9 with NVIDIA drivers  575.x. The node is available temporarily in partition **math-alderaan-gpu-cuda12** with maximum runtime 1 day. Singularity containers with CUDA 11 should still work with **singularity exec --nv**. Testing reports welcome. Note: CUDA 12.9 is **not compatible with current Tensorflow** version yet. A singularity container will be provided. 

### 2025/07/29

* Node **math-alderaan-h01** was upgraded to CUDA 12.9 with NVIDIA drivers  575.x. The node is available temporarily in partition **math-alderaan-cuda12** with maximum runtime 1 day. Singularity containers with CUDA 11 should still work with **singularity exec --nv**. Testing reports welcome. 
* Node **math-alderaan-h02** is available only in partition **math-alderaan-gpu-short** in order to allow installation of CUDA drivers upgrade to continue with 24 hours lead time.

### 2025/07/25

* Waiting for information from the vendor regarding CUDA drivers upgrade, which are needed for CUDA 12 and pytorch. Nodes **math-alderaan-h[01,02]** are still running in partition **math-alderaan-gpu-short** only, in order to allow installation of CUDA drivers upgrade to continue with 24 hours lead time once ready to proceed.

### 2025/07/02

Nodes **math-alderaan-h[01,02]** are draining for short maintenance (hardware reset) planned for tomorrow 10am.

* After the reset is completed:
    * **math-alderaan-h01** will be available in both partitions **math-alderaan-gpu** and **math-alderaan-gpu-short**
    * **math-alderaan-h02** will be available in **math-alderaan-gpu-short** only, with a maximum job duration of one day, for faster job turnaround.

* Continuation of maintenance (CUDA drivers upgrade) on **math-alderaan-h02** is planned next week, date TBD.

### 2025/06/30

* Due to ongoing maintenance including upgrade of CUDA drivers and hardware reset:
    * Partion **math-alderaan-gpu** is down. Please use partition **math-alderaan-gpu-short** (1 day job duration max).
    * Jobs will execute on node **math-alderaan-h01**. Node **math-alderaan-h02** is not available.

### 2025/06/24

* Partition **math-alderaan-gpu** was disabled **temporarily** to allow nodes **math-alderaan-h[01,02]** drain for maintenance next week. Please use partition **math-alderaan-gpu-short** to run on the nodes. Partition **math-alderaan-gpu-short** will be disabled one day prior to the maintenance. Existing jobs will be allowed to finish.

* The GPU partitions were reconfigured **permanently** so that the **math-alderaan-gpu-short** partition can provide a faster turnaround for shorter jobs (up to one day), while longer jobs (up to 7 days) can run using the **math-alderaan-gpu** partition.
    * Jobs submitted to the **math-alderaan-gpu** partition can run on node **math-alderaan-h01** only.
    * Jobs submitted to the **math-alderaan-gpu-short** partition can run on node **math-alderaan-h02**, or, if the node is not available, on **node math-alderaan-h01**, with a higher scheduling priority.
    
### 2025/06/22

* Node math-alderaan-h02 resumed, removed from math-alderaan-gpu, and left in math-alderaan-gpu-short partion only so that it can be drained faster in future. 

### 2025/06/21

* Node math-alderaan-h02 is being drained due to an issue with its Baseboard Management Controller (BMC). It will be returned service after all jobs running on it end and a visit to the datacenter can be scheduled.
* Node math-alderaan-c07 removed from Slurm.

### 2025/05/16

* 11am Configuration changes of Jupyterhub in progress.

### 2025/05/12

* 10am Troubleshooting math-alderaan-c07 in the datacenter. A related network issue prevented submitting new jobs from about 11am to 2pm.
* Node math-alderaan-c07 will not power up and is permanently down.

### 2025/04/29

* Cooling is back to normal. Operations normal, except node math-alderaan-c07 is down.
* When you report a problem with a job, please do not change the files and let me know where they are.  
### 2025/04/28

* 12:30 pm Hardware maintenance planned, no downtime expected.
    - Hard reset node math-alderaan-c07 to hopefully return it to operations.
    - Install additional fans in front of storage nodes to reduce their temperature.
      
* 6:00 pm
    - math-alderaan-c07 responds on out of band network, but won't power up yet.
    - Ambient temperature improved.
    - Additional fans for the storage nodes were installed.
       
### 2025/04/27

* Alderaan is available for general use. Go ahead, by using it you will help testing the improved thermal monitoring and management. Always copy important files elsewhere.

* Storage nodes are still too warm. Until the disk temperature improves, Alderaan will run at a reduced speed (in a suspend all jobs - resume cycle) as needed.

### 2025/04/26

* 01:00 Alderaan jobs running at 1/2 speed (10 sec suspended, 10 sec resume) to reduce I/O load.

* 08:10 Alderaan shut down due to sustained high temperature.

* 12:00 Cooled down, but the storage nodes are still too hot for sustained usex.

### 2025/04/25

* 12:00 am
    - Alderaan jobs are running at 2/3 speed (10 sec suspended, 20 sec resume).
    - /data002 is back.
    - math-score nodes and math-colibri-i02 are now available.
    - Alderaan may shut down any time without a notice.
    - As always, **please maintain copies of essential data elsewhere.**

### 2025/04/24

* 12:00 pm  Alderaan is running in a reduced capacity mode.
    - **All jobs are being periodically suspended and resumed** to allow disk activity to resolve and prevent jobs from entering uninterruptible disk wait (`D` state), and to reduce sustained thermal load on RAID and compute nodes. This strategy helps maintain system responsiveness under degraded thermal conditions, but results in the cluster operating at approximately **1/3 of normal speed**. This ratio may be changed as needed.
    - `/data002` and therefore `/scratch` remain **offline** due to ongoing issues.
    - Alderaan may shut down any time without a notice.
    - As always, please maintain copies of essential data elsewhere.

### 2025/04/23

* 12:50 pm High temperature persists. The datacenter temperature is not critical, but it is high enough to potentially damage the storage system over time.  All compute nodes are draining so that no new jobs can start. Nodes are being powered off as they become drained, to prepare for a complete shutoff. /data002 is not available.

* 3:00 pm Datacenter temperature near normal. /data002 recovered. Existing jobs restarted. User login temporarily enabled.

* 6:00 pm Dataceter overheating returned. All jobs suspended. /data002 powered off to protect data.
  
### 2025/04/22
* 10am Alderaan restarted. /data002 not available due to continued effects of overheating.

### 2025/04/21

* 6:40pm  All alderaan nodes were shut down automatically because of high datacenter temperature. 

### 2025/04/15

* The reconfiguration of cgroups is ongoing.  The goal is that every job will get guaranteed the resources it reserves and jobs can run on the same node together without interfering with each other.  Enforcement of the reservations by the system can change as I am ironing out the bugs and edge cases.

To see what your job is doing, you can try:
    
     max_mem.sh  <nodename>

to see the reservations,

    scontrol show <job number>

to see what slurm knows about it, and

    ssh <nodename>
    top

or

    top -b -n 1

to see the cpu and memory in use by each process.

### 2025/04/10

* A reconfiguration of cgroups in slurm is in progress. Cgroups is a mechanism to ensure each job stays within allocated resources, such as cores and memory. Some jobs were escaping these controls, such as generated by sbatch issued from an sbatch script, causing occasional overcommitment of nodes and crashed jobs. A fix is being deployed on a rolling subset of nodes, which reduces the number of available cpus. 

### 2025/03/14

* 4pm Planned downtime. Duration: 1 to 3 days. I’ll aim to minimize downtime, but Alderaan may be down until Monday 3/17. All running jobs will be cancelled. Use #SBATCH --requeue in your job script if you wish your job to be requeued automatically. Queued jobs should not be affected. Access will be unavailable to assure a quiet system.  Planned Work: 1. Migrating `/home` and `/storage` from a legacy server to faster Alderaan storage. The time required for this depends on the volume of recent changes in these directories, so please minimize adding new files in these directories if possible. 2. Deploying cgroups to allow multiple jobs to share nodes more efficiently without potentially interfering with each other.
   
### 2025/03/06

* [Jupyterhub](../jupyterhub) available, section added to the documentation.

### 2025/02/27

* 5:00am All nodes are draining to test SLURM reconfiguration. No new jobs can start. Running jobs are not affected. When enough nodes are drained and become available for the test, the drainging will stop and the remaining nodes will accept new jobs.

* 10am Testing on nodes math-alderaan-c05 and math-alderaan-h01 is in progress. Regular jobs run on other nodes.
 **Please do not hesitate to let us know if you see any unusual behavior.** 

### 2025/02/10

* 10:20am Login issues resolved.

### 2025/02/09

* 3:30om We are aware of ongoing login issues affecting some users. The issue is being investigated with OIT, and updates will be provided as they become available.

### 2025/01/19

* 2am The SLURM scheduler was migrated from a virtual machine at urgent risk of failure to another host, but the state of running and queued jobs could not be preserved. User login enabled.

* 7am SLURM appears to function normally. Affected users were notified to resubmit their jobs.

### 2025/01/18

* 11pm Urgent SLURM scheduler maintenance. User login blocked. Existing jobs keep running,

### 2024/10/21 

* 11am Partial downtime. Several nodes wil have their thermal profile lowered to reduce overheating and cycling of CPU speed under load. The nodes cycle the CPU governor settings profile automatically to mitigate excessive CPU temperatures, which may result in inconsistent performance.

* 1pm Maintenance completed. The thermal design profiles of several nodes were decreased to 180W or less in few cases. One failed drive in the math-alderaan-s02 disk array was replaced. Operations normal.  

### 2024/10/16

* Please access the cluster only through the `math-alderaan` login node. The legacy login node `clas-compute` may give ssh errors or not respond at all.
* Several nodes are draining or in drain state to prepare for maintenance Monday 2024/10/21.

### 2024/09/24

* 7pm Several nodes inaccessible or down after an earlier network outage.
* 9pm All alderaan and score nodes normal.

### 2024/09/11

* Matlab working now. Reason: the license server has changed.
 
### 2024/09/10

* Matlab license not working.

### 2024/07/25

* Nodes math-alderaan-c[02,13,24] had issues that made at least some jobs allocated to them fail, sometimes with no files created. 
  Reason: time synchronization. Fixed.

### 2024/07/12

* **Storage migration in progress - please do not add or modify large volume of files in /home and /storage** The /home and /storage directories are on a slower legacy file server and commands (like conda) and jobs using files there are getting stuck at times. For this reason, I have been migrating /home and /storage to high-performance Alderaan disk arrays over the last few months. It takes up to a day to synchronize /home and /storage with their new location even if nothing changed, plus a few hours for every hundred GB in new or modified files. The final synchronization and the switch to the new location will be done in a scheduled downtime (to be announced soon) on quiet data.  **A large volume of new or modified files in /home and /storage will make the downtime longer.** Deleting or moving files away is OK, and smaller changes are OK too. You are welcome to keep running jobs, I'd just like to encourage you to write new files to your directory in /data001/projects; the easiest may be to run your jobs from there.

### 2024/07/01

* The downtime ended, all should be normal. There will need to be continuation, which will be announced in due course.

### 2024/06/28

PLANNED DOWNTIME FRIDAY 6/28 starting at 6pm

* The /home directories are being migrated to a higher performace storage to fix issues such as processes in indefinite D (disk wait) state, which has been making slurm jobs and conda stuck in many cases. 
    This last phase of the migration requires a quiet system to transfer the last changes and switch the storage. Therefore, **all logins will be blocked and all Slurm jobs cancelled when the downtime starts.**

* Submission of new slurm jobs will be turned off from Thursday 6/27/2024 6 pm

* To help keep the downtime shorter, please avoid creating or modifying large files or a large number of files in your home directory. Use your directory in /data001/projects instead.

### 2024/06/27

* Matlab license fixed
* **All partitions will be marked down at 6pm in preparation of the scheduled downtime tomorrow**

### 2024/06/26

* MATLAB license not working again

### 2024/06/24

* MATLAB not working because it cannot contact license server. Investigating.
  - Update: fixed
* SLURM job submission may not work. Existing jobs should not be affected. Investigating.
  - Update: the issue produces warnings but job submission now appears normal.

### 2024/04/26

* 10am-12pm Planned maintenance time for network testing and configuration. From about 9am, logins will be disabled, partitions stopped, and running jobs suspended or cancelled. Some nodes may be rebooted. Suspended jobs may be able to continue after the maintenance ends, but it is not guaranteed.

* 3pm Maintenance completed. Please let me know if you see any errors.

### 2024/04/12

* 2:30pm Files  in /home and /storage mounts dropped on randomly changing compute nodes. Investigating. All partitions are stopped, no new jobs will start. Existing jobs are allowed to continue, though they may have a difficulty doing so.
* 5pm All nodes were rebooted and the issue has resolved. All partition queues started.

### 2024/04/11

* 4pm Slurm is down. Investigating.
* 7pm Fixed
* Users' directories in /data001/projects were moved to /data002/projects because of issues with /data001 and replaced by soft links to the new locations. Therefore, the original location shows the same files and it can still be used. No action required at this point.

### 2024/04/10

* **Maintenance is planned from 11am**
Several nodes are draining and partition math-alderaan-short is not accepting jobs. Nodes which become available will be rebooted.

### 2024/03/26

* **Maintenance is planned  for Tuesday 3/26 from 10am.**
The math-alderaan partition will keep running, but only on a subset of nodes, which will be
shrinking as idle nodes become reserved for the upcoming maintance. I will try to maintain at least one idle node for new jobs.
The math-alderaan-short and math-alderaan-gpu-short partitions will not accept new jobs starting Monday 3/25 10am so that any jobs running on them can finish within the 1 day partition limits.
The math-alderaan-gpu partition is not not accepting any new jobs until maintenance is complete.
No jobs will be cancelled.

* Node math-alderaan-c30 has a bad memory slot and runs with memory reduced to 480GB. It will not be allocated to jobs and currently is reserved for system service.

### 2024/03/21

* **Alderaan maintenance planned** From about 10am, nodes which become idle will be rebooted to update their CPU power and heat settings further and returned to operation one by one. The rest of the nodes with jobs running on them will be updated later. No jobs will be cancelled. 

### 2024/03/20

* 10:45pm All nodes are currently draining and no jobs can start on them to prepare for maintenance tomorrow.

* Node math-alderaan-c06 is down and being sent for repair.

### 2024/03/18

* **3pm Alderaan maintenance completed**.  math-alderaan-c[02,14] are still draining and will have their heat envelope reset when they and I become available at the same time. math-alderaan-c06 has a bad memory board and will be down until fixed. All other nodes are available. Please let me know if you note anything odd.

### 2024/03/15

**Alderaan maintenance in progress**. I am decreasing a maximum generated heat setting (called TDP) on all Alderaan CPUs. This should decrease the switching of 

* the CPUs to a slower power saving mode when they overheat, and thus result in smoother and more reliable operation within the available cooling capacity. 
The change was already done on Alderaan nodes c01 c05 c11 c31 c32, which will keep running normally. Currently, no new jobs can start on any remaining Alderaan nodes, including GPU nodes, but existing jobs are allowed to complete. Alderaan nodes that will have no jobs running on them by Monday 3/18 will be rebooted and have their TDP reset. All Alderaan nodes are expected to be available by the end of the day. No jobs will be cancelled.
If you need to run something urgently between now and Monday and the large number of unavailable nodes is a problem, please let me know.

### 2024/03/13

* 16 nodes are currently draining. When jobs on them end, no new jobs will start.
The plan is to have at least 10 nodes with no jobs running on them available for
maintenance planned 2024/03/18.  

### 2024/03/11

Singularity containers workshop 11am in SCB 4017.

### 2024/03/04

* 08:12am Login to math-alderaan does not work. Investigating. Please use clas-compute to submit and access slurm jobs for now.
* Rebooted, all normal.

### 2024/02/24

* Added a switch to CPU power saving mode in case of overheating, as an intermediate step before suspending nodes, which should be happening only rarely now.

### 2024/01/26

* Added an independent monitor with 3 levels of emergency shutdown in case of datacenter overheating: 1. suspend all jobs 2. graceful shutdown of all compute and storage nodes  3. complete poweroff (not reversible remotely)

### 2024/01/25

* 10:30am All alderaan nodes are powered up. Held jobs released and running.

### 2024/01/21

* 11:30am The head nodes math-alderaan and clas-compute are up. User files are accessible. Score nodes are available but alderaan nodes are down until further notice.

### 2024/01/20

* 02:00pm All systems shut down because of datacenter cooling issue.

### 2023/12/02

We are currently undergoing some important updates and maintenance on our HPC system. Here’s what you need to know:

* **Slurm Reconfiguration:** This is in progress to enhance job isolation and scheduling. Jobs currently running will remain unaffected. However, there might be temporary changes in the behavior when submitting new jobs. Please report any unexpected issues.

* **GPU Nodes Update:** The nodes math-alderaan-h[01-02] are temporarily offline for testing and configuration. During this period, no new jobs will be started on these nodes.

* **Memory Board Replacement:** Nodes math-alderaan-c[29-32] are being prepared for maintenance due to a faulty memory board on math-alderaan-c29. These nodes will be powered down for the installation of a replacement memory board when it is received. New jobs will not start on these nodes until the maintenance is complete.

* **Heat Diagnostics:** Nodes math-alderaan-c[01,05,07,10] are currently offline for heat diagnostics. No jobs can be initiated on these nodes during this period.

* **Access Restrictions:** As a reminder, please avoid SSH access directly to any nodes, especially those that are currently drained or draining.

We appreciate your understanding and cooperation during this maintenance phase. Our goal is to ensure a more robust and efficient HPC environment for all users. Thank you for your patience.

### 2023/10/19

* 08:30am Head node math-alderan stuck, rebooted.

### 2023/09/27

* 08:50pm Head node math-alderan stuck, rebooted.

### 2023/09/21

* Workshop: An Introduction to Computing on the Cluster (11AM-12PM in UC Denver SCB 4125)

* All math-alderaan nodes returned to service after the workshop except 01 02 05 07 remain in drain state for heat stress testing. 

* Due to no cpus available to start new jobs, all user accounts were reset to default maximum 500 concurrent cpus. There are some cpus available now (nodes showing as idle or mixed).

* The maximum concurrent cpus limit can be increased on request or temporarily silently if the cluster is underutilized.

### 2023/09/20

* Several nodes are draining and max concurrent cpus of large array users was reset in preparation for the workshop at 11am.

### 2023/09/19

* 11:54pm: math-alderaan not accepting user ssh connections, filesystems dropped. Rebooted.

### 2023/09/10

* 7:43pm math-alderaan not accepting ssh connections

* 11:10pm The math-alderaan head node was stuck. Rebooted remotely.

* When you can't log into math-alderaan, please use the alternative head node clas-compute. All user files are there and you can submit slurm jobs as usual. 

### 2023/08/08 

* MATLAB was upgraded to R2023a with all toolboxes in CU Denver license installed. This is now the
default on alderaan nodes.

To use the previous installation, type first

    module load matlab/R2021b

### 2023/07/14

* 2:30pm: Alderaan compute nodes automatically shutting down due to high data center temperature, jobs start getting suspended. 

* 3:10-4:10: Complete outage of all compute nodes.

* 4:30: Jobs resuming automatically, operations normal.

### 2023/07/08

* approx 2:00pm: Login issues to math-alderaan and clas-compute head nodes reported. 
The file server is down, systems not accessible until further notice.

* approx 8pm: service restored, operations normal.

### 2023/05/18

* approx 2:30pm: Operations normal

* approx 12pm: Network outage this morning was fixed, but login issues persist. 
Please check here or try later. Thanks for your patience! 


### 2023/04/21

* Guide [how to use Personal Globus endpoint](../globus) for data transfer is now available. It was ported from the legacy [wiki](http://ccm.ucdenver.edu), updated, and tested. Globus can transfer large quantities of data (many TB) and work through firewalls.


### 2023/04/08 

* Various nodes are draining for heat testing under load. After the current jobs 
on them complete, no new jobs will be able to start on them 
until the testing is completed.

* Node math-alderaan-c07 remains unavailable.

### 2023/04/04

* The data center is too warm for running Alderaan nodes at full CPU load. 
Jobs on nodes that are running too hot are getting suspended automatically
until the CPUs cool down, in particular math-alderaan-c[05,07].
See the real-time
[Status](https://demo.openwfm.org/web/alderaan/cpu_temp.txt) for more detail.
The temperature cutoffs were adjusted lower to keep the system from overheating.

* Node math-alderaan-c07 is out for repair. Its temperature rise was too fast and cycling could not keep it at safe temperature.

### 2023/03/07

* Optimization solver Gurobi with one year site license added to the  /storage/singularity/pyscipopt-geopandas.sif container.

### 2023/03/06

* Workshop: Introduction to Shell Scripting on Alderaan (12:30-1:30 p.m MST Hybrid)

### 2023/02/20

* Front end math-alderaan is back online. Operations normal.

### 2023/02/18

* Front end math-alderaan is down. 
The Alderaan cluster is accessible through the alternate front end by

     ssh clas-compute 

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

* Node math-alderaan-c01 is down again. Investigating.

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

