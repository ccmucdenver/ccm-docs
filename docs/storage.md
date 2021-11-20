# Research Storage

## Funding
This equipment was purchased in 2021 from CCM budget.
## Purpose
A storage facility for the [research clusters](../clusters_guide), including home directories. [Alderaan](../alderaan) has also its own storage disk arrays.
## Hardware
Research storage (clas-rcstor-01) is a Dell PowerEdge R730 24 cores/48 threads and 512GB of DDR4 memory which acts as both system RAM (minimal) and (mostly) high speed file system cache.
 
The array has currently two Dell md3060e 60 Disk storage shelves attached to it:
 
* CLAS Research storage array: 60 3TB 7200rpm SAS 6Gb disks in a spanned RAIDZ2 pattern - 5x RAIDZ2, which is equivalent to a 5 span RAID 60. This will be used for non-math project and home directory space. (around 120TiB total)
* Math Research storage array: 24 8TB 7200rpm SATA disks and 24 4TB 7200rpm SAS disks in a spanned RAIDZ2 pattern – 4x RAIDZ2 which is equivalent to a 4 span RAID 60. This is used for math projects, home directories, and other administrative space. This array also has a 1TB SSD read cache and 1TB write cache (about 193TB total).
* The storage array is set up so any span can be replaced with larger and/or higher performance drives on a smaller scale (12 drives) than replacing all drives at once.
* Each dataset can then be carved out of one of these arrays and set a quota and separate compression level as desired.

## Software
TrueNAS by iXsystems on FreeBSD

## How to use
The storage is mounted on cluster nodes as NFS filesystems. Users cannot access the storage server directly.

