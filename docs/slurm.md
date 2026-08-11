# Slurm

## Viewing Job Queues, Job Status, and System Status

### Queues and partitions

Jobs are submitted to compute nodes through the scheduler. To see the queues, which Slurm calls partitions, use:

    sinfo

Partitions with shorter runtime have higher priority.

### Nodes

To see a list of all nodes, use:

    sinfo -N

Nodes `math-alderaan-c01` to `math-alderaan-c32` are compute nodes. Nodes `math-alderaan-h01` and `math-alderaan-h02` are high memory GPU nodes.

### Jobs

The command `squeue` shows one line for each job running on the system.

The command `squeue.sh` shows the CPUs, memory, and GPUs requested by each pending job, with expected start times. The command `jobs.sh` shows reserved resources and jobs by node.

Real-time system status including temperature, load, and partitions is available in [News and Status Updates](updates.md).

## Submitting Jobs to the Scheduler

The <code>sbatch job_script</code> command is used to submit a job into a queue. Your job starts executing in the directory where it was submitted, so submit it from a directory accessible to all compute nodes, such as a subdirectory of your home directory. You can add switches to the <code>sbatch</code> command, but it is recommended to make them a part of your batch script so that you do not have to do that every time. Please do not use more cores than the number of tasks specified in your script.

### Template batch job scripts

The template batch scripts and simple examples to run are available. Get your copy by
    
        git clone https://github.com/ccmucdenver/templates.git 
        
To build the examples, type <code>make</code> in the <code>examples</code> directory. 

**Please do not request the number of nodes on Alderaan by `--nodes` or `-N`, unless you really need entire nodes for some reason. Request only the CPU cores you need by `--ntasks`, then the node or nodes you use can be shared with others.**

### Slurm Directives with Explanations

| Directive             | Explanation                                                  | Options |
| ---------------------- | ------------------------------------------------------------ | ------- |
| `#SBATCH --job-name=`  | Specifies a name for your job.                               | Use whatever naming convention makes sense to you! If you would like a suggestion: `#SBATCH --job-name=job`<br>`#SBATCH --output=job.out`<br>`#SBATCH --error=job.err` |
| `#SBATCH --output=`    | Specifies the file to which standard output (stdout) will be redirected. |  |
| `#SBATCH --error=`     | Specifies the file to which standard error (stderror) will be redirected. |  |
| `#SBATCH --nodes=`     | Specifies the number of nodes requested for the job.         | Please do not request a node unless you know you need the full node’s memory or CPU |
| `#SBATCH --ntasks=`    | Specifies the number of tasks.                               | Start small and request only the CPUs the application can use. |
| `#SBATCH --mem-per-cpu=` | Specifies memory allocated per requested CPU.              | The default is `4096M`; increase it for applications that need more memory. |
| `#SBATCH --partition=` | Specifies the partition or queue where the job will be submitted. | Recommend: Use CPU or GPU Alderaan partitions. <br> CPU nodes, specify: `#SBATCH --partition=math-alderaan`<br>GPU nodes, specify: `#SBATCH --partition=math-alderaan-gpu`<br> |
| `#SBATCH --qos=`       | Requests a Quality of Service (QoS) class for resource limits and runtime limits. | Most jobs do not need this. Use only a QoS that is enabled for your account. |
| `#SBATCH --array=`     | Specifies an array of job tasks with indices for array job submissions. <br> Examples: <br> `#SBATCH --array=1-5` <br> `#SBATCH --array=0-10,20-21` | You can specify how many array jobs to run at one time with `%`. <br> Example: <br> Run only 3 jobs at one time for 10 jobs: `#SBATCH --array=1-10%3` |

### Requesting memory

Slurm allocates `4096M` of memory per requested CPU by default. To make the request explicit, add:

    #SBATCH --mem-per-cpu=4096M

Increase `--mem-per-cpu` if the application needs more memory. Total requested memory is the number of allocated CPUs multiplied by the memory requested per CPU. Cgroups enforce the allocation, so exceeding it may terminate the job. Do not request extra CPUs merely to obtain memory.

Compute nodes provide `500000M` of schedulable memory. To use nearly all of it, request all 64 CPUs with `#SBATCH --mem-per-cpu=7800M`, for `499200M` total. High-memory GPU nodes provide `2000G` each.

### Job priority

Alderaan uses Quality of Service (QoS) classes and scheduling priority to manage resource allocation and job scheduling. Job priority depends on the QoS, on the partition, and on the job size (the number of CPUs).

#### Quality of Service (QoS)

By default, all jobs run with QoS `normal`, which limit the user to 500 concurrent CPUs and 3500GB memory.  No `--qos` line is needed for such workloads. Other QoS classes allow users to use larger numbers of CPUs or GPUs concurrently, but jobs using these QoS classes have lower maximum time and lower scheduling priority. Current per-user CPU and GPU limits are listed in [Accounts](accounts.md#running-jobs). 

To submit a job with a QoS other than `normal`, add a QoS directive to the job script and request resources within the limits of that QoS. For example:
```
#SBATCH --qos=burstcpu
```
To list all available QoS classes on the cluster, run:
```
sacctmgr show qos format=Name,MaxWall,MaxTRESPU -P
```
To see which QoS classes you are authorized to use, run:
```
sacctmgr show assoc where user=$USER format=Account,QOS,DefaultQOS -P
```
On compute nodes, the QoS are set up to limit the total number of CPUs and also the total memory per user at 7GB for 1 CPU. GPU/high memory nodes have separate per-user limits, currently 96 CPUs and 3000GB.

Only request QoS classes that are listed for your account. If a job requests a QoS that is not authorized for your account, `sbatch` will reject the submission with an error such as `Invalid qos specification`.

If a QoS you need is not listed for your account, contact Alderaan Help from your CU Denver email with a brief description of your resource requirements.

#### Partition priority and maximum run time

We use partition priority to prioritize short-running jobs. A job submitted to a partition with a shorter maximum run time, i. e., `math-alderaan-short`, `math-alderaan-gpu-short`, or `math-alderaan-gpu-quick`, has a higher scheduling priority than the same job submitted to the `math-alderaan` or `math-alderaan-gpu` partition. 

The requested job time (`--time`) does not directly affect the job’s priority. It determines which partitions the job is eligible to use and also affects backfill scheduling: jobs with shorter requested run times may run sooner, because they can fit into more available scheduling windows without delaying higher-priority jobs.

#### Job size

The Slurm scheduler gives larger jobs higher priority and then schedules smaller jobs around them. Lower-priority job may start while higher-priority jobs are waiting if Slurm determines that running the lower-priority job will not delay the expected start of the higher-priority jobs.  Consequently, **smaller jobs with fewer CPUs and shorter requested run time often run sooner**.

### How to make your job start faster

Use these practical rules to improve queue wait time.

* **Request only what you need.**
    * Keep `--time` short, only for the time you need.
    * Use `--ntasks` smaller, only for the number of cores you need.
    * Avoid `--nodes` unless you really need full nodes.

* **Choose partition and runtime strategically.**
    * Use shorter-runtime partitions when possible, they have higher priority.

* **Control array submission pressure.**
    * Limit array concurrency with `%` (for example `--array=1-1000%10`).
    * Avoid flooding the queue with too many simultaneous tasks.

* **Check system pressure before submitting.**
    * `sinfo` for partition availability.
    * `squeue` for queue status.
    * `squeue.sh` and `jobs-on-nodes.sh` for resource detail by job and node.
    * [News and Status Updates](updates.md) for current operational constraints.

* **Use these full-node rules of thumb.**
    * Compute nodes: requesting 64 cores or memory near 500GB is effectively a full-node job.
    * High-memory GPU nodes: requesting memory near 2000GB or two GPUs is effectively a full-node job.
    * If your request is effectively full-node, reducing minor settings usually will not make the job start faster. Focus on accurate runtime, partition choice, and current queue conditions.

## Interactive jobs

Remember you should not directly ssh to a node because it would interfere with jobs scheduled to run on that node. For interactive access to a compute node, do instead:

```
srun -p math-alderaan --time=2:00:0 -n 1 --pty bash -i
```
This will request a session for you as a job in a single core slot on a compute node in the math-alderaan partition for up to 2 hours. After the job starts, your session is transfered to the node. The job will end when you exit or the time runs out. Of course you can do the same for other partitions and add other flags such as to request more cores or a GPU.

See [Examples](examples.md#interactive-job-on-gpu) for an interactive GPU example.

## How to use GPUs

### How to run with a GPU on Alderaan

The partitions 

    math-alderaan-gpu-short
    math-alderaan-gpu
   
have two high memory/GPU nodes`math-alderaan-h[01,02]` with two NVIDIA A-100 40GB GPUs and 2TB memory each. Use `--partition=math-alderaan-gpu-short` (1 day job duration maximum) with `--gres=gpu:a100:1` to request one GPU and `--gres=gpu:a100:2` to request two GPUs. For longer jobs, up to 7 days, you can use `--partition=math-alderaan-gpu`, but node availability may be limited and your job may wait longer.
 
**Please do not try to use Alderaan GPUs without allocating them by `--gres` as above first. Please do not request an entire node on Alderaan by `--nodes` or `-N`, unless you really need all of it, request only the CPU cores you need by `--ntasks`. Large memory jobs and GPUs jobs can share the same node.**

If the `gpu_short_4` QoS has been enabled for your account, you can use it with any GPU partition to allow up to 4 concurrent GPUs for jobs up to 24 hours. Add `#SBATCH --qos=gpu_short_4` and `#SBATCH --time=24:00:00` to your script.

GPU software stack and TensorFlow compatibility-container guidance are maintained in [Singularity Containers](singularity.md).

See [Examples](examples.md) for batch and interactive GPU examples.
