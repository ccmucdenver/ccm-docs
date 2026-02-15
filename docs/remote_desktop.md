# Remote Desktop

## What this is

Alderaan provides a remote graphical desktop session
(similar quick interactive use as having a monitor attached).

This is useful for MATLAB, R graphics, visualization, and debugging.

## Quick start

1. Connect to the CU Denver network (on campus or VPN).
2. Open Remote Desktop on your computer (on MacOS, Windows App from the App Store)
3. Connect to PC name: `math-alderaan`

Should that not work, try: `math-alderaan.ucdenver.pvt`

Click away the certificate warning.

Log in with your CU Denver | Anschutz username and password.

## Connection through VMware Horizon

1. Go to [https://remote.ucdenver.edu](https://remote.ucdenver.edu), download the app (recommended).
2. Log into the web client or the app with your CU Denver | Anschutz username and password.
3. Click on the Remote Desktop tile.
4. Connect to Computer: `math-alderaan`
   
Should that not work, try: `math-alderaan.ucdenver.pvt`

Click away the certificate warning.

Log in with your CU Denver | Anschutz username and password.

## Copy/Paste
### Windows
- Copy:  Ctrl+C
- Paste: Ctrl+V

### macOS

Recommended settings in the Windows App:
- Enable clipboard sharing.
- Settings -> Keyboard, choose *Either Command* and make sure all boxes below are checked.
- Do not remap Command to Control

Copy/Paste tip:
- In terminals, Command+C may stop programs instead of copying.
- Use the mouse right-click (two fingers tap on a touch pad) menu for Copy and Paste if unsure.

## Session behavior

- Closing the Remote Desktop window disconnects but keeps your session running.
- Reconnecting returns you to the same desktop.
- Logging out in the desktop ends the session completely.

## Performance and appropriate use

All users share the same interactive node.

- Use this for light interactive work only.
- For heavy computation, submit batch jobs via SLURM.
- For notebooks, [JupyterHub](../jupyterhub) is usually faster.

Do not use Alderaan including this service for confidential or controlled data.

This service uses the lightweight [XFCE desktop environment](https://docs.xfce.org/xfce/getting-started#the_desktop_environment). It behaves in some aspects differently from native Windows or macOS desktops.

## Troubleshooting

- Window at login ending with "could not be authenticated" → Click OK and try again.
- Cannot connect → check VPN or campus network.
- Black screen then disconnect → wait 30 seconds and reconnect.
- Copy/paste not working → use right-click (two finders tap) menu inside the desktop.
- In R, open the graphics window by the command `x11()`
- You can use Firefox to open graphics files.
