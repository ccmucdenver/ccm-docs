# Accounts
## Eligibility
Employees, students, and external collaborators sponsored by a faculty member. `ucdenver.edu` or `cuanschutz.edu` login with VPN access required.


## How to get an account

Please 

  * **Read the [Terms and Conditions](../TermsandConditions) first.**
  * Use [this form](https://forms.office.com/r/GQ9ef7ei4i) to request an account. **For a permanent account, the form should be filled by a faculty member (the PI of the project) and list users in their group, such as students, postdocs, or external collaborators.** Compliance needs the legal "yes" clicks from a faculty member. External collaborators need an affiliate appointment called "POI" with remote access first, talk to your department HR contact. Check "security" on their affiliate form to request VPN.

The form will ask for the **CU Denver email addresses** for all accounts to be created, and

  * A brief description of the project. Just few words are enough. 
  * Funding source, if any,
  * Affirmation of the [Terms of Use](../#terms-of-use),

This is needed for reporting to the funding agency (annual reports, quad charts, PI meetings, etc.)

We really need the "yes" clicks for all those terms and conditions!

**Workshop participants can also get a temporary account by filling the form with "Workshop" in the project box.**


## Resources and Allocations

To encourage early use, the folowing is in effect for an initial period - we want you to work here! A more formal allocation process will start when needed.

### Storage

**Users are responsible for maintaining copies of all their important files elsewhere. Files can be lost even with backups.**

  * **Home directories** – Home directories are `/home/username`. Please keep the home directories small, up to 25GB. Backed up occasionally. **Home directories over 25GB may not be backed up.** 
  * **Project storage** -  **Not backed up.**  All users have project directory. These are `/data001/projects/username` or `/storage/department/projects/username`. We can make project directories which can be shared between a group of users. Please keep project directories to 25OGB.
  * **Scratch** - no limit, **not backed up, older files may be deleted automatically**. Please make your own subdirectories in `/scratch`. In future, files will be deleted automatically when the filesystem fills up.

Use the command `du -sh` in a directory to see how much storage space you are using, and `df` to monitor the overall storage space. The space used can be different from the size of your files as reported by `ls -l`, particularly for very large files.

### Running Jobs

  * Users are set up with the initial 500 concurrent cores limit. More is possible upon request. Your cores limit may be increased quitely temporarily when your jobs are waiting and there are enough cores available for everyone.
  * Run time of jobs on math-alderaan nodes is maximum 7 days. This is a hard limit. Job run time on other math-score nodes is unlimited.
  * The total usage of CPU and GPU hours is unlimited.

<!-- 

### Storage 

!Files with oldest access date may be purged automatically when the scratch space usage is over 80%.
 
  * **Home directories** are `/home/username`. Home directories up to 25GB are backed up occasionally. The default allocation is planned to be 25GB per user in future. 




The planned allocaton  in future are:

  * **Small** - up to 30,000 Alderaan core hours, max 128 concurrent cores per user, standard storage. Automatic with an account.
  * **Medium** - up to 150,000 Alderaan core hours, max 640 concurrent cores, additional storage.
  * **Large** - larger than medium. 

Jobs are charged for the total reserved core time, whether used or not.  

-->

## Old Files
 
  * After a period of user inactivity, user files can be deleted after a notification to the user's university email address and a grace period.
  * Older files in scratch space can be deleted also for active users.


