# Accounts
## Eligibility
Employees and students with `ucdenver.edu` or `cuanschutz.edu` login credentials. 
External collaborators sponsored by a faculty member.

## How to get an account

Please use [this form](https://forms.office.com/r/GQ9ef7ei4i) to request accounts. 

**For a permanent account, the form should be filled by a faculty member (the PI of the project) and list users in their group, such as students or external collaborators.**
External collaborators need a POI (a type of affiliate appointment) with VPN access first, talk to your department HR contact. Check "security" on their form.

The form will ask for the **CU Denver email addresses** for all accounts to be created, and

* a brief description of the project (few words, one line is best),
* funding source, if any,
* affirmation of the [Terms of Use](../#terms-of-use), which include an acknowledgement of the NSF grant 2019089 in all publications and presentations, and send us at least a citation. The publication itself is always appreciated.

This is needed for reporting to the funding agency (annual reports, quad charts, PI meetings, etc.)

We really need the "yes" clicks for all those terms and conditions!

**Workshop participants can also get an account by filling the form with "Workshop" in the project box.**


## Resources and Allocations

To encourage early use, the folowing is in effect for an initial period - we want you to work here! A more formal allocation process will start when needed.

### Storage

**Users are responsible for maintaining copies of all their important files elsewhere. Files can be lost even with backups.**

* **Home directories** – Home directories are `/home/username`. The `/home` filesystems are limited size, please keep the home directories small, up to 25GB. Backed up occasionally. **Home directories over 25GB are not backed up.** 
* **Project storage** -  **Not backed up.**  All users have project directory `/data001/projects/username` which is on a **much faster and more reliable** filesystem. Most users have also legacy project directory in  `/storage/department/projects/username`. Please do not add a large volume of files to these legacy directories, this slows down the migration to faster and more reliable hardware. We can make project directories which can be shared between a group of users. Please keep project directories to 25OGB.
* **Scratch** - no limit, **not backed up, files may be deleted**. Please make your own subdirectories in `/scratch`. In future, files will be deleted automatically when the filesystem fills up.

Use the command `du -sh` in a directory to see how much storage space you are using, and `df` to monitor the overall storage space. Home directories and most project directories are on a storage system which is using space very efficiently, so the space used can be much less than the actual size of your files as reported by `ls -l`.

### Running Jobs

* Users are set up with the initial 500 concurrent cores limit. More is possible upon request.
* Run time of Alderaan jobs is maximum 7 days. This is a hard limit. Job run time on other clusters (Colibri, Score) is unlimited.
* The total usage of CPU and GPU hours is unlimited.


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


