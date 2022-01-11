# Accounts and Allocations
## Eligibility
Faculty and students with cudenver.edu or cuanschutz.edu login credentials. Please request an account or allocation first, because your directory needs to be created before you can log in successfully.
## Process
Account and allocation requests should be sent to jan.mandel@ucdenver.edu. If you need more than the default number of core hours or storage, your allocation request should include:
* a brief description of the project (few sentences),
* funding source, if any, with an agency, grant number, and title 
* a brief justification of the resources requested, with an aticipated number of runs, the number of cores per run, the total size files generated per run, and the total size of external data the user will bring in.

## Alderaan Core Time
* **Small** - up to 30,000 core hours, max 128 concurrent cores per user, automatic with an account.
* **Medium** - up to 150,000 core hours, max 640 concurrent cores, requests reviewed monthly
* **Large** - larger than medium, requests reviewed quarterly. 
Jobs are charged for the number of reserved cores time, whether used or not.
Core time use on other clusters than Alderaan and on GPU nodes is currently not limited.

## Storage 
** NOTE: Files can be lost, even with backups. Users are responsible for maintaining copies of their important files elsewhere.** 
 
* **Home directories** – 25GB max, more can be requested with an allocation request. Backed up weekly, keeping 4 backups from various times. Home directories are `/home/user`, usually implemented as soft links.
* **Project storage** -  250GB max, more and group project storage can be requested with an allocation request. **Not backed up.** Project directories are in  `/storage/department/projects/name`, often implemented as soft links.
* **Scratch** - no maximum, not backed up. Files with oldest access date will be purged automatically when usage is over 80%. Users should make their own subdirectories in `/scratch`.

## Transitional Rules

Existing home directories under 25GB are being migrated to backed-up space. **Existing home directories larger than 25GB will not be backed up**. Users should bring their home directories under the limit so that they can be migrated to backed-up space.
 
Existing projects get initial storage allocation equal to the current use + 10% + the standard project quota. 
 
The storage limits apply now. The clusters will transition to enforced quotas over time. 
 
## Old files
 
Upon project or user inactivation, the files will be deleted after a notification (if the user's university email still works) and a grace period. 


