# Remote Desktop

XRDP remote desktop provides a graphical interface to Alderaan similar to having your own monitor connected directly to Alderaan, running in a window.
All desktop sessions of all users share one compute node, so please do not overload it. 

This service is intended for interactive work such as visualization, debugging, and GUI-based tools. Batch computation must still be submitted via Slurm.

## Access

You need to be on the CU Denver  internal network, or VPN, or connect from [VMWare Horizon Remote Desktop](https://remote.ucdenver.edu) (Click on * Complimentary* after you log in). 

## Windows

Use Remote Desktop Connection (built-in). No special configuration required. Create PC **math-alderaan**
* Copy: Ctrl+C
* Paste: Ctrl+V

## macOS

* Install **Windows App**  from the App Store. In the app Settings
•	Enable clipboard sharing.
•	Use default keyboard mode (do not remap Cmd to Ctrl).
*   In Settings -> Keyboard, choose *Either Command* and make sure all boxes below are checked.
*  Connection -> Add PC -> PC name **math-alderaan**, leave all else at defaults.
*  Copy: Select text with mouse and tap with two fingers on it, then Copy in the menu. Command+C (macOS) may be understood as interrupt rather than copy.
*  Paste: Command+V

## Session behavior

* Sessions persist after disconnect
* Reconnecting resumes the same desktop
* Logging out ends the session

## Keyboard notes
* The desktop is Linux-based, therefore mouse and keyboard, esp. shortcuts, may behave in some ways differently than your client (Windows or macOS). 
.

```

