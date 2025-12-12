# Apache Spark on Alderaan (Single‑Node Usage)

## Overview

Apache Spark is a distributed data‑processing framework designed for large‑scale parallel computation using resilient distributed datasets (RDDs), DataFrames, and SQL‑like operations. Spark is typically deployed on clusters using a resource manager such as **YARN**, **Kubernetes**, or Spark’s own **standalone** cluster manager.

On **Alderaan**, none of these Spark cluster managers are installed. However, Spark can still be used effectively in **local mode** within a single SLURM job allocation. In this mode:

* Spark runs entirely on **one compute node**.
* Parallelism is provided by **threads**, not distributed executors.
* SLURM controls resource allocation (nodes, CPUs, memory).
* Spark uses the allocated CPUs via `local[N]` execution.

This setup is suitable for:

* Prototyping Spark applications
* Moderate‑scale data processing on a single node (up to 64 cores)
* Teaching and experimentation

It is **not** a multi‑node Spark cluster.

---

## Key Constraints on Alderaan

* No system‑wide Spark installation
* No Hadoop / YARN
* No `HADOOP_CONF_DIR`
* No Spark standalone cluster

All Spark usage must therefore:

* Be installed in **user space** (e.g., via conda)
* Run inside a **single SLURM job**
* Use `spark-submit --master local[N]`

---

## Installing Spark with Conda

Create a dedicated conda environment:

```bash
conda create -n spark1node -c conda-forge python=3.11 pyspark
conda activate spark1node
```

Verify the installation:

```bash
which spark-submit
spark-submit --version
```

You should see Spark reporting a version (e.g. 4.x) and Java runtime information.

---

## Example Spark Program (π Estimation)

Create a file `spark_pi.py`:

```python
from pyspark.sql import SparkSession
import random

spark = SparkSession.builder.appName("pi").getOrCreate()
sc = spark.sparkContext

n = 1_000_000
count = sc.parallelize(range(n)).map(
    lambda _: 1 if (random.random()**2 + random.random()**2) <= 1 else 0
).sum()

pi_est = 4.0 * count / n
print(f"pi_est={pi_est}")

spark.stop()
```

Test interactively (single node, login shell):

```bash
spark-submit --master local[4] spark_pi.py
```

---

## Running Spark in a SLURM Job (1 Node)

Create a SLURM batch script `spark1node.sbatch`:

```bash
#!/bin/bash
#SBATCH -p math-alderaan
#SBATCH -N 1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH -t 00:10:00
#SBATCH -J spark1node
#SBATCH -o slurm-%j.out
#SBATCH -e slurm-%j.err

source ~/.bashrc
conda activate spark1node

spark-submit \
  --master "local[${SLURM_CPUS_PER_TASK}]" \
  --conf "spark.local.dir=/tmp/$USER/spark-$SLURM_JOB_ID" \
  ~/spark_pi.py
```

Submit the job:

```bash
sbatch spark1node.sbatch
```

Check job status:

```bash
squeue -j <jobid>
scontrol show job <jobid>
```

View output:

```bash
cat slurm-<jobid>.out
cat slurm-<jobid>.err
```

---

## Why `--master local[N]` Is Required

* SLURM enforces CPU limits using cgroups.
* Spark does **not** automatically understand SLURM allocations.
* `local[N]` explicitly tells Spark how many worker threads to use.

Using:

```bash
--master "local[${SLURM_CPUS_PER_TASK}]"
```

ensures:

* Spark uses **exactly** the CPUs allocated by SLURM
* No oversubscription
* Predictable performance

Do **not** rely on Spark defaults such as `local[*]`.

---

## About Hadoop and HADOOP_CONF_DIR

* Hadoop is **not installed** on Alderaan.
* Spark runs using its **built‑in Java I/O**.
* Warnings such as:

```text
Unable to load native-hadoop library
```

are expected and harmless in this configuration.

---

## What This Setup Can and Cannot Do

### Supported

* Parallel Spark workloads on one node
* Up to 64 CPU cores
* RDDs, DataFrames, Spark SQL
* PySpark applications

### Not Supported

* Multi‑node Spark jobs
* YARN / Kubernetes / Standalone Spark clusters
* Inter‑job Spark communication
* Long‑running Spark services

---

## Recommended User Guidance

For Alderaan users:

* Use Spark **only in local mode**
* Always run Spark inside a SLURM job
* Always specify `--master local[N]`
* Treat Spark as a **threaded analytics framework**, not a cluster service

---

## References

* Apache Spark documentation: [https://spark.apache.org/docs/latest/](https://spark.apache.org/docs/latest/)
* PySpark API: [https://spark.apache.org/docs/latest/api/python/](https://spark.apache.org/docs/latest/api/python/)
