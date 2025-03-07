# JupyterHub

## Access

JupyterHub provides a graphical interface to Alderaan from a web browser. You need to be on the CU Denver 
internal network, or VPN, or connecting from [VMWare Horizon Remote Desktop](https://remote.ucdenver.edu) (Click on *Complimentary* after you log in.)
Start a web browser - Firefox recommended - and go to

  [https://math-alderaan](https://math-alderaan)

or, if the short name does not work, use the full name

  [https://math-alderaan.ucdenver.pvt](https://math-alderaan.ucdenver.pvt)

Click away the warnings, and log in with your University username and password. Then click on the blue *New Server* button. After a short
time, you should see the JupyterLab screen. Your JupyterLab session will run somewhere on Alderaan on a dedicated CPU with 4GB of memoty.

To access files and directories outside of your home directory, you can make soft links to them in a terminal and then click on the soft 
in the file tree.

**JupyterHub is a new, still experimental addition to Alderaan. The web interface may be unavailable and running sessions may be interrupted as we keep working on it, so please save your files frequently.** 

Please write Alderaan Help from CU Denver email if you have any suggestioms or requests.

## Adding a Conda Environment as a Jupyter Kernel

### Using the Terminal

1. **Activate your conda environment** (replace `myenv` with your environment's name):
   \`\`\`bash
   conda activate myenv
   \`\`\`

2. **Install the `ipykernel` package** (if not already installed):
   \`\`\`bash
   conda install ipykernel
   \`\`\`

3. **Register the environment as a Jupyter kernel**:
   \`\`\`bash
   python -m ipykernel install --user --name myenv --display-name "Python (myenv)"
   \`\`\`

This command registers the environment as a kernel available in Jupyter Notebook under the display name “Python (myenv)”.

### Using a Jupyter Notebook

You can run the same commands within a notebook cell by prefixing them with `!`. For example:

\`\`\`python
# Install ipykernel in your environment (if needed)
!conda install ipykernel -y

# Register the kernel (ensure your notebook is running in the desired environment)
!python -m ipykernel install --user --name myenv --display-name "Python (myenv)"
\`\`\`

After running these commands, restart your Jupyter Notebook server. When creating a new notebook or changing the kernel in an existing one, the "Python (myenv)" option should be available.

---

## Removing a Conda Environment Kernel

### Using the Terminal

1. **List all installed kernels**:
   \`\`\`bash
   jupyter kernelspec list
   \`\`\`

   Example output:
   \`\`\`
   myenv    /home/username/.local/share/jupyter/kernels/myenv
   python3  /usr/local/share/jupyter/kernels/python3
   \`\`\`

2. **Remove the kernel** using its kernel spec name (for example, `myenv`):
   \`\`\`bash
   jupyter kernelspec remove myenv
   \`\`\`

   Confirm the deletion when prompted.

### Using a Jupyter Notebook

You can also run the removal command from a notebook cell:
\`\`\`python
!jupyter kernelspec list
# Identify the kernel spec name you want to remove, then:
!jupyter kernelspec remove myenv
\`\`\`

---

## Additional Notes

- **Display Name vs. Kernel Spec Name:**  
  The `--display-name` option sets the name displayed in the Jupyter Notebook launcher, while the kernel is managed by its spec name (e.g., `myenv`). When removing a kernel, always use the kernel spec name.

- **User Permissions:**  
  These commands are run under your user account, so no admin rights are required.

- **Refreshing the Environment:**  
  After adding or removing kernels, you may need to restart your Jupyter Notebook server to see the changes.
```

