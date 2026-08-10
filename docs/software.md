# Installing Software

Use the dedicated guides for software environments:

* [Environment Modules](modules.md) for system-provided software.
* [Singularity Containers](singularity.md) for containerized software stacks.
* [Conda and Python](conda.md) for user-managed environments.

If you need older software versions, contact support. Availability depends on whether compatible dependencies can still be built or obtained.

## Installing your own software packages

Install user packages in your own home or project directories, not system locations.

For Python environments and package management, use [Conda and Python](conda.md).

If you use R, configure a personal R library path in your home directory so package installs do not interfere with other tools.

## Building Your Own Software

Here are the best practices when you compile and link your own software:

* Use `math-alderaan` head node to build software for use on the Alderaan cluster. See [Environment Modules](modules.md) for available tools. We can add other tools and package them in modules on request.

* Alderaan nodes run CentOS 8.
