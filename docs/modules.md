# Environment modules

**Environment modules are available on Alderaan front end and compute nodes only.**

## Purpose

Environment variables, such `PATH`, allow to select software to become available.
Modules manage the environment automatically, without the user having to set the 
environment variables by hand, which is tedious and error prone. 

Alderaan modules include compilers (GNU, AMD, and Intel) and MPI.

## Basic module commands

`module load modulename` - make the software pointed to by the module available

`module unload modulename` - make the software pointed to by the module unavailable

`module purge` -  unload all modules

`module list`  - list which modules are loaded

`module avail` - list of all available modules

## Modules and running code

When you load a collection of modulea to compile a code, you generaly need to load
the same modules before you run the resulting executable. Otherwise you may get
runtime errors when the executable cannot find runtime libraries or it gets
mismatched libraries, such as MPI.

In particular, batch scripts should start with loading the same modules that
were loaded before buiding the software.  

## Modules and containers

The use of modules to manage the environment is standard in HPC. They fulfil a
similar function as containers, but the software is installed on the system rather
that being carried in a container. 
