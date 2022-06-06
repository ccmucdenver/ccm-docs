# News and Status Updates

Please contact jan.mandel@ucdenver.edu with any questions.

Reload the page to see the latest information. Your browser may be caching an old version.

Real-time:  &nbsp;  &nbsp; [Temperature](https://demo.openwfm.org/web/alderaan/temp.txt) &nbsp; &nbsp; [CPU load](https://demo.openwfm.org/web/alderaan/cpu.txt) &nbsp; &nbsp; [Memory](https://demo.openwfm.org/web/alderaan/mem.txt) &nbsp; &nbsp; [Swap](https://demo.openwfm.org/web/alderaan/swp.txt) &nbsp; &nbsp; [Partitions](https://demo.openwfm.org/web/alderaan/sinfo.txt)

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

* History below was backfilled from email later.

### 2022/05/25

Alderaan powered down during the nighnt, circuit breakers on the PDU tripped. Restarted in the morning.

Work in the datacenter will resume tomorrow morning.
The whole alderaan cluster will be powered off.
Colibri, score, and clas-compute should not be affected.

### 2022/05/24

OIT rearranged power cables to help the airflow. All nodes are up except  
math-alderaan-c18  math-alderaan-c28  math-alderaan-h02,
which have known hardware issues. 

Please go ahead and use the cluster. Don't be bashful, all cores at full load would be great to test the new cable scheme.

### 2022/05/23

3:10pm The maintenance is done for today. 

math-alderaan-h01 is back, with a single GPU.
math-alderaan-h02 has to go back to the vendor and should be back in due time.
math-alderaan-c18 still down. It will take few days to get a replacement memory board.
math-alderaan-c[25-32] are down, verified due to a power issue. We will work on that with OIT tomorrow. Taking care of power distribution issues may involve taking down other parts or even all of the alderaan cluster temporarily tomorrow. The clas-compute head node, the score cluster, and the colibri cluster should not be affected.


### 2022/05/20

Work will continue on the GPU/high memory nodes math-alderann-h01 and h02 Monday from about 12:30. The nodes will be offline from and any jobs running will be killed.  The nodes will be put in drain status in advance.

Nodes math-alderann-c18 and c25-32 are down. We'll investigate the issue Monday afternoon. Node c18 has hardware failure, the rest may be only a power issue.

Some other nodes may be powered off and jobs running on them killed during the maintenance. We'll try to minimize that.

