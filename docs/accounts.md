# Accounts and Allocations

## Resources and Allocations

To encourage early use, the folowing is in effect for an initial period - we want you to work here! A more formal allocation process will start when needed.

### Storage

**Users are responsible for maintaining copies of all their important files elsewhere. Files can be lost even with backups.**

* **Home directories** – Home directories are `/home/username`. The `/home` filesystems are limited size, please keep the home directories small, up to 25GB. Backed up occasionally. **Home directories over 25GB are not backed up.**
* **Project storage** -  **Not backed up.** Project directories are in  `/storage/department/projects/username`. We can make project directories which can be shared between a group of users. Please keep project directories to 25OGB.
* **Scratch** - no limit, **not backed up**. Please make your own subdirectories in `/scratch` (accessible from Alderaan nodes only). In future, files will be deleted automatically when the filesystem fills up.

Use the command `du -sh` in a directory to see how much storage space you are using, and `df` to monitor the overall storage space. Home directories and most project directories are on a storage system which is using space very efficiently, so the space used can be much less than the actual size of your files as reported by `ls -l`.

### Running Jobs

* Users are set up with initial 500 Alderaan concurrent cores limit. More is possible upon request.
* Run time of Alderaan jobs is maximum 7 days. This is a hard limit. Job run time on other clusters (Colibri, Score) is unlimited.


<!-- 

### Storage 

!Files with oldest access date may be purged automatically when the scratch space usage is over 80%.
 
* **Home directories** – Home directories are `/home/username`. Home directories up to 25GB are backed up occasionally. The default allocation is planned to be 25GB per user in future. 




The planned allocaton  in future are:

* **Small** - up to 30,000 Alderaan core hours, max 128 concurrent cores per user, standard storage. Automatic with an account.
* **Medium** - up to 150,000 Alderaan core hours, max 640 concurrent cores, additional storage.
* **Large** - larger than medium. 

Jobs are charged for the total reserved core time, whether used or not. 
Jobs on Alderaan GPU/high memory nodes are charged for all 64 cores on the node. 

-->

## Old Files
 
Upon project or user inactivation, the files will be deleted after a notification (if the user's university email still works) and a grace period. 


