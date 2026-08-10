# Logging in

Your account must be set up before using the system. Please go to [accounts](accounts.md) for more about getting an account.

To access the Alderaan cluster, you need to be on the CU Denver or CU Anschutz private network. This can be done in several ways:

* On campus wired network.
* On campus secure wireless network (not the guest network)
* Through [CU Denver](https://www.ucdenver.edu/vpn) or [CU Anschutz](https://www.cuanschutz.edu/vpn) by GlobalProtect VPN.   **Windows Subsystem for Linux (WSL) is not recommended with VPN**, as GlobalProtect sometimes does not forward 
connections properly from WSL, even though it works for other Windows applications.
* Through [Remote Desktop](remote_desktop.md).

To log in, use your university username (not email) and password. If you do not know your username, you can retrieve it at [https://myaccount.ucdenver.edu/forgot-username](https://myaccount.ucdenver.edu/forgot-username).

We currently offer three ways how to access Alderaan cluster:

* [JupyterHub](jupyterhub.md).
* [Remote Desktop](remote_desktop.md).

* Secure Shell (SSH) is a classical way to access Alderaan from the command line. Type **ssh username@math-alderaan.ucdenver.pvt** in a terminal window on Linux or Mac, or in a Powershell window on [Windows](https://learn.microsoft.com/en-us/windows/terminal/tutorials/ssh) 10 or 11 (Press Windows button, search box opens, type `shell`, select `Powershell`). If you omit the username, your computer may send your local username instead, which may not work. You  can [use the .ssh/config file](https://linuxize.com/post/using-the-ssh-config-file) to fill the correct username and to automate connections. For more convenience and security, you can
set up [passwordless ssh from Linux](https://www.geeksforgeeks.org/how-to-login-to-ssh-without-a-password-using-private-key) as well as 
from [Windows](https://stackoverflow.com/questions/71422512/passwordless-ssh-connection-from-windows).

 SSH also allows you to transfer files via scp, sftp, or rsync commands. 

## Interactive use limitations

Using a server ‘interactively’ (a.k.a. not scheduling a job) is often needed for troubleshooting a job or just watching what it is doing in real time. After SSH’ing into a head node, start an interactive Slurm job as described in [Interactive jobs](clusters_guide.md#interactive-jobs), or use [JupyterHub](jupyterhub.md), where your session will run as a Slurm job for up to a week.

***Please do not run anything computationally intensive on the head `math-alderaan`.*** This can destabilize important services which keep the cluster running,and make the experience worse for everyione.

**Please do not run anything directly on compute nodes without a reservation. They are reserved for jobs under the control of the Slurm scheduler, even if you may be able to ssh there.  These are nodes with names like math-alderaan-c01 with something else than "i" before the number. Using compute nodes, where other people run jobs through the scheduler, will interfere with their work and make you very unpopular.** It is OK to ssh to a compute node to check on your job, but  don't run anything there.
   
## Screen virtual terminal in interactive usage

If you use `screen`, if you get disconnected, whatever you were running is still going and you can connect to it later. This is called a virtual terminal session. It is generally a good idea to use `screen` on math-alderaan only.

Typing `screen` creates a new terminal session. You can give it a name you want to juggle more sessions, by `screen -S 'name'`  (make the name whatever you want). 

If you want to disconnect from the session but leave it running, hit the combination of Control-A and press the D key to disconnect. Control-A is the combo to let screen know you want to do an action.

When you want to reconnect to your screen session later, log back onto wherever you started the screen and type <code>screen –r</code>. If you have more than one screen, it’ll complain and tell you the screens you have available to reconnect to. Type <code>screen –r 'name’</code> to reconnect to that screen. 
 
You can't just scroll in `screen` to see your terminal history as you normally would.
Press Control-A and then Esc and scrolling up and down will work temporarily the usual way. When you type anything, `screen` will leave the scrolling model.

## Linux Introduction  

If you are new to Linux command-line usage, start with:

* `pwd`, `ls`, `cd` for navigation
* `cp`, `mv`, `rm` for file operations
* `cat`, `echo`, and `nano` for basic file viewing and editing

Use `man <command>` for detailed help, for example `man rsync` or `man srun`.
