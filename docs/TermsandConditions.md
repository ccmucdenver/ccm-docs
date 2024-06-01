# Center for Computational Mathematics (CCM) University of Colorado Denver

## Terms and Conditions

### Acknowledgment
**All work must acknowledge the CCM and reference the NSF grant number.** Here is a suggested acknowledgement:

*"This work used the computing resources at the Center for Computational Mathematics, University of Colorado Denver,
including the Alderaan cluster, supported by the National Science Foundation award
[OAC-2019089](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2019089)."* 

Please the PI [jan.mandel@ucdenver.edu](mailto:jan.mandel@ucdenver.edu) copies of and links to all such
work published or posted. 

### Legal
**You (the user) are responsible for ensuring compliance to the data restrictions as outlined below. Failure to adhere
to these restrictions may result in account deactivation, and immediate deletion of any or all data.**

* No project or data are allowed on this resource that require compliance with any regulations or security standards, including HIPPA, FERPA, NIST SP 800-171, etc. No Controlled Unclassified Information (CUI) is allowed. This system is not suitable
for [highly confidential data in CU classification](https://www.cu.edu/data-governance/resources-support/data-classification). 

* No export controlled technology or technical data related to the Export Administration Regulations (EAR) or the International Traffic in Arms  Regulations (ITAR) is permitted.
  
* The above includes data, software, and results generated as output. The user is responsible for ensuring compliance. Failure to adhere to this policy may result in account deactivation, and immediate deletion of any or all data maintained by the user on the resource.

* All usage of this resource must be fundamental research, intended to be published with no restrictions or approval
requirement by the sponsor, or any restriction on the nationality of the participants.

### In plain language

Please do not store any sensitive information on this system, such as proprietary data, health records, 
grades, social security numbers, or data related to technology restricted in any way, in particular technology which may be subject
to restrictions on export to some countries. 

### Connecting from this system and file protections

If you use ssh keys to connect from this system, such as to github or 
another computer account, it is highly recommended to use an ssh key with a passcode you have to type in every time. 
Otherwise, the security your other account is only as good 
as the protection of your files here. 

We use the standard Linux file permissions, which cannot be considered secure. 
In particular, anyone with an administrator account can access any files.

### Storage

**All files stored on this cluster may be lost at any time with no notice. You (the user) must  maintain copies of all
important files elsewhere.** 

All users must keep their home directories under 25GB so that backup of all home directories is possible.
Additional project storage is available, which is not backed up. 

By default, files and directories, including your home directory, are created such that all other users have read
permissions. This is Linux default to encourage collaboration. If you want to keep a file or directory private from 
users other than system administrators, you need to manually change the permissions for that file or directory.
 To do so type the command below:

    chmod og-rwx file_or_directory_name

For more information on storage, see the [Clusters Guide](../clusters_guide/#file-storage).

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
