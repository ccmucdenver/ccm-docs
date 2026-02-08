# Remote Desktop

**This is an experimental feature. Testing and comments welcome.**

**Contact: jan.mandel@ucdenver.edu**

Alderaan provides a remote Linux desktop (XFCE) accessible via [Microsoft Remote Desktop (RDP)](https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients). The desktop provides a graphical interface to Alderaan similar to having your own monitor connected directly to Alderaan, running in a window on your computer.

## Access

You need to be on the CU Denver  internal network, or on VPN, or connected from [VMWare Horizon Remote Desktop](https://remote.ucdenver.edu) (Click on *Complimentary* after you log in. For better performance, you can download and use the Horizon app.) 

## Usage

This service is intended for interactive work such as visualization, debugging, and GUI-based tools, such as MATLAB or R. The Alderaan remote desktop uses the lightweight [XFCE desktop environment](https://docs.xfce.org/xfce/getting-started#the_desktop_environment). It behaves in some aspects differently from native Windows or macOS desktops.

### Windows

Use Remote Desktop Connection (built-in). No special configuration required. Create remote PC **math-alderaan**.
* Copy: Ctrl+C
* Paste: Ctrl+V

### macOS

* Install **Windows App**  from the App Store.
* In the app Settings:
    *	Enable clipboard sharing.
    *	Use default keyboard mode (do not remap Cmd to Ctrl).
* In Settings -> Keyboard, choose *Either Command* and make sure all boxes below are checked.
* Connection -> Add PC -> PC name **math-alderaan**, leave all else at defaults.
* Copy: Select text with mouse and tap with two fingers (right click) on it, then Copy in the menu that appears. Command+C (macOS) is understood by Linux terminal as interrupt rather than Copy.
* Paste: Command+V, or tap with two fingers (right click), then Paste in the menu that appears.

## Resources and performance

All desktop sessions of all users share one compute node, so please be mindful of other users. 

For computations requiring many cores or many GB of memory, please use batch jobs. Batch computation must still be submitted via SLURM. 

Jupyter notebooks generally perform better in the [JupyterHub](../jupyterhub) directly in a web browser, where your session will run in a batch job with its own allocation of resources.

## Session behavior

* Sessions persist after disconnect.
* Reconnecting resumes the same desktop.
* Logging out ends the session.

## Notes
* The desktop is Linux-based, therefore it will behave somewhat differently than a Windows or macOS desktop.
* Names and details may change with software versions.
* If the name **math-alderaan** does not work, use **math-alderaan.ucdenver.pvt**
* MATLAB displays its normal GUI.
* In R, open the graphics window by **x11()**
* You can use Firefox to open graphics files.
