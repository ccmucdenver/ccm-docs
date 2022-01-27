# Accounts and Allocations
## Eligibility
Faculty and students with cudenver.edu or cuanschutz.edu login. Please request an account first, your directory needs to be created before you can log in successfully.
## Process
Account and allocation requests should be sent to jan.mandel@ucdenver.edu. If you need more than the default core or storage resources below, your allocation request should include:

* a brief description of the project (few sentences),
* funding source, if any, with an agency, grant number, and title 
* a brief justification of the resources requested, with an aticipated number of runs, the number of cores per run, the total size files generated per run, and the total size of external data the user will bring in.

## Resources
**To encourage early use, storage and core time limits below are currently soft and may be extended as needed - we want you to work here**! The limits will be activated in future when needed to keep the resources available fairly for everyone.

### Cores
* **Small** - up to 30,000 Alderaan core hours, max 128 concurrent cores per user, automatic with an account.
* **Medium** - up to 150,000 Alderaan core hours, max 640 concurrent cores, requests reviewed monthly
* **Large** - larger than medium, requests reviewed quarterly. 

Jobs are charged for the total reserved core time, whether used or not. 
Jobs on Alderaan GPU/high memory nodes are charged for all 64 cores on the node. 

Core time on other clusters than Alderaan is not limited.

### Storage 
**Users are responsible for maintaining copies of their important files elsewhere. Files can be lost, even with backups.** 
 
* **Home directories** – 25GB, more on request. Backed up weekly, keeping 4 backups from various times. Home directories are `/home/user`, usually implemented as soft links. Existing home directories under 25GB are being migrated to backed-up space. **Existing home directories larger than 25GB will not be backed up**. Users should bring their home directories under the limit so that they can be migrated to backed-up space. 
* **Project storage** -  250GB, more on request. **Not backed up.** Project directories are in  `/storage/department/projects/name`, often implemented as soft links. Existing projects get initial storage allocation equal to the current use + 10% + the standard project quota. 
* **Scratch** - no limit, not backed up. Files with oldest access date will be purged automatically when the scratch space usage is over 80%. Please make your own subdirectories in `/scratch`.

 
## Old files
 
Upon project or user inactivation, the files will be deleted after a notification (if the user's university email still works) and a grace period. 


