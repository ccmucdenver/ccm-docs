# Center for Computational Mathematics (CCM) University of Colorado Denver

## Terms and Conditions

### Legal
**You (the user) are responsible for ensuring compliance to the data restrictions as outlined below. Failure to adhere
to these restrictions may result in account deactivation, and immediate deletion of any or all data. Violations may also
result in administrative or legal consequences.**

Please do not store or process any sensitive information on this system, such as proprietary data, health records, 
grades, social security numbers, potentially defense-related data, or data related to technology restricted in any way, 
particularly technology which may be subject to restrictions on export to some countries. In more detail:

* **No [CU highly confidential](https://www.cu.edu/data-governance/resources-support/data-classification) data are allowed, which includes any data requiring compliance with any regulations or security standards, such HIPPA, FERPA, NIST SP 800-171, etc. No Controlled Unclassified Information (CUI) is allowed.**
  
* No sensitive techology or export controlled technology or technical data related to the Export Administration Regulations (EAR) or the International Traffic in Arms  Regulations (ITAR) is permitted.
  
* The above includes data, software, and results generated as output. 

* **All use of this resource must be fundamental research, intended to be published with no restrictions or approval
requirement by the sponsor, and no restriction on the nationality of the participants.**

### File protection and privacy

By default, files and directories, including your home directory, are created such that *all other users have read access to your files*. This is a Linux default to encourage collaboration. If you want to make a file or directory not accessible by other users (except for system administrators), you need to manually change the permissions for that file or directory. To do so type the command below:

    chmod og-rwx file_or_directory_name

Please note that file permissions cannot be considered secure. 

### Storage

**Any files stored on this cluster may be lost at any time with no notice. You (the user) must  maintain copies of all
important files elsewhere.** 

All users should keep their home directories under 25GB. We may not be able to back up or migrate larger directories. 
Additional project storage is available, which is not backed up. Storage designated as scratch may be deleted and is the 
lowest priority in the case of storage issues. 

We use redundant storage technologies. Data migration may be required to mitigate a localized hardware failure and for upgrades. 
But we may not be able to migrate very large files or directories and such files are more likely be lost.

For more information on storage, see the [Clusters Guide](../clusters_guide/#file-storage).

### Connecting from this system to the outside 
If you use ssh keys to connect from this system, such as to github or 
another computer account, it is highly recommended to use an ssh key with a passcode you have to type in every time. 
If you use an ssh key without a passcode, security of the account you are logging into is only as good 
as the protection of your files here, which **cannot be considered secure**.

### Ackowledgement of Support

**All work should acknowledge the CCM and reference the NSF grant number.** Here is a suggested acknowledgement:

*"This work used the computing resources at the Center for Computational Mathematics, University of Colorado Denver,
including the Alderaan cluster, supported by the National Science Foundation award
[OAC-2019089](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2019089)."* 

Please the PI [jan.mandel@ucdenver.edu](mailto:jan.mandel@ucdenver.edu) copies of and links to all such
work published or posted. 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
