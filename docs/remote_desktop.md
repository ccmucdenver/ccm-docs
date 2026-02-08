# Remote Desktop

## Quick start

1. Connect to the CU Denver network (on campus or VPN).
2. Open Remote Desktop on your computer (on MacOS, Windows App from the App Store)
3. Connect to:

   PC name: `math-alderaan`

If that does not work, try: `math-alderaan.ucdenver.pvt`

Log in with your CU Denver | Anschutz username and password.

## What this is

Alderaan provides an experimental remote graphical desktop session
(similar quick interactive use as having a monitor attached).

This is useful for MATLAB, R graphics, visualization, and debugging.

## Windows

Use the built-in “Remote Desktop Connection” app.

- PC name: `math-alderaan`
- Copy:  Ctrl+C
- Paste: Ctrl+V

## macOS

Install “Windows App” from the App Store.

Recommended settings:
- Enable clipboard sharing.
- Settings -> Keyboard, choose *Either Command* and make sure all boxes below are checked.
- Do not remap Command to Control

Copy/Paste tip:
- In terminals, Command+C may stop programs instead of copying.
- Use the mouse right-click (two fingers on a touch pad) menu for Copy and Paste if unsure.

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

- Cannot connect → check VPN or campus network.
- Black screen then disconnect → wait 30 seconds and reconnect.
- Copy/paste not working → use right-click menu inside the desktop.
- In R, open the graphics window by **x11()**
- You can use Firefox to open graphics files.
