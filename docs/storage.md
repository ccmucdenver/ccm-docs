# File Storage

**You are responsible for keeping copies of your important files elsewhere. Files and entire filesystems can be lost.** 

The home directories are on a shared file server and linked as `/home/username`. Everyone can have also 
a project directory. The legacy project directories are  `/storage/department/projects/username` 
(where department may be one of many departments who use this system). New project directories are currently 
created as `/data001/projects/username` instead. The location of the project directory is emailed to the user
when the directory is created as a part of setting up a new account.

In addition, groups can request shared project directories also in `/storage/department/projects` or `/data001/projects`. 

The difference between project and home directories is that home directories are backed up occasionally (if not too large)
while project directories and too large home directories are not backed up. Please keep your home directory small to make the backups possible. 
Please be aware that even if disk space is large and currently not restricted, it is finite.

Please monitor the usage of the partition you are on by 

     df -h . 

and if it nearing full check you you do not use more space than you are aware of by `df -h`. If you need a lot of data storage, please contact us before filling everything you can find.

On Alderaan, you can make your own directory in `/scratch`.
**When `/scratch` starts filling up or the space is needed for the system, oldest files will be purged automatically.**

**Do not keep any confidential or sensitive files on this system.** We are not equipped for the level of security this would take. 
In particular, proprietary data, health records, grades, social security numbers, or **data which have to comply with any 
law or regulation are not allowed**. 

If you use ssh keys to connect elsewhere from this system 
(such as github or another computer account), it is **highly recommended to make an ssh key with a passcode** for that. **Otherwise,
 the security of the account you are connecting to is only as good as the read protection of your files here, which is not much.**

Files and directories including your home directory are created with permissions which allow anyone to read them but not 
write. This is Linux default to encourage collaboration. If you want to keep a file or directory private, you need to change the permissions yourself. 
Type <code>chmod og-rwx file_or_directory_name</code> to make the file or directory not accessible by others (except system administrators, who can access anything).


<!---
`df –h` will show you the storage arrays and how much space is available. There are different types of "empty" space in linux so it may say there is plenty of space in `df –h` yet the array is full.
-->

## File Transfer

Recommended options:

* [Globus File Transfer](globus.md) for large unattended transfers.
* `rsync`, `scp`, or `sftp` for command-line transfers.
* `git clone` for source repositories.
* `wget <URL>` for direct downloads.

Examples:

    scp ~/Desktop/file.txt username@math-alderaan.ucdenver.pvt:/home/username/
    scp username@math-alderaan.ucdenver.pvt:/home/username/file.txt ~/Desktop/
