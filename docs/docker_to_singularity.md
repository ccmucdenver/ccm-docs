# Building and Pushing Singularity Containers on ARM for Alderaan Cluster
By: Gunnar Enserro - updated: Mar 26, 2025

This guide demonstrates how to build a Docker image on ARM architecture, push it to Docker Hub, and convert it to a Singularity container for use on a cluster. We'll leverage Docker's platform emulation capabilities to ensure compatibility between ARM-based development environments and x86/AMD64 cluster deployments.

## Prerequisites

1. Docker Desktop for Mac installed
2. A Docker Hub account
3. Access to a cluster with Singularity installed

## Building Docker Image on Mac

Please replace "\<tag-name>" with your projects tag name

### 1. Install Linux/AMD64 Platform Support

First, you need to enable platform support for Linux/AMD64 in Docker Desktop:

1. Open Docker Desktop
2. Click on the gear icon (Settings)
3. Go to "Features in development"
4. Enable "Use Rosetta for x86/amd64 emulation on Apple Silicon"
5. Click "Apply & Restart"

### 2. Build the Docker Image

Navigate to your project directory containing the Dockerfile and run:

```bash
docker build --platform linux/amd64 -t <tag-name> .
```

This command:
- `--platform linux/amd64`: Specifies the target platform
- `-t <tag-name>`: Tags the image with the name "inverse-ising"
- `.`: Uses the Dockerfile in the current directory

## Pushing to Docker Hub

### 1. Tag Your Image

First, tag your image with your Docker Hub username:

```bash
docker tag <tag-name> your-dockerhub-username/<tag-name>:latest
```

Replace `your-dockerhub-username` with your actual Docker Hub username.

### 2. Login to Docker Hub

```bash
docker login
```

Enter your Docker Hub credentials when prompted.

### 3. Push the Image

```bash
docker push your-dockerhub-username/<tag-name>:latest
```

## Building Singularity Container on Cluster

Once your Docker image is pushed to Docker Hub, you can build the Singularity container on the cluster:

```bash
singularity build <tag-name>.sif docker://your-dockerhub-username/<tag-name>:latest
```

This command:
- Creates a Singularity container named `<tag-name>.sif`
- Pulls the Docker image from Docker Hub
- Converts it to Singularity format

## Example: Building a Statistical Sampling Environment

This example demonstrates how to set up an environment for a statistical sampling tool in Python. Since I work on Apple Silicon hardware, which doesn't support building Singularity containers locally, I'll show the workflow of building a Docker container locally and then converting it to Singularity on the cluster.

### Dockerfile
```yaml
FROM continuumio/miniconda3

# Update and install system dependencies
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y install -f build-essential && \
    apt-get -y install -f libboost-all-dev && \
    apt-get -y install -f git && \
    apt-get -y install rename && \
    apt-get -y install trash-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create conda environment
RUN /opt/conda/bin/conda create -y -n InverseIsing -c conda-forge \
    python=3.10 \
    numpy \
    pandas \
    scipy \
    numba \
    cython \
    jupyter \
    ipython \
    multiprocess \
    boost==1.74 \
    matplotlib \
    mpmath \
    blas=*=openblas \
    pip

# Initialize conda in bash
RUN /opt/conda/bin/conda init bash && \
    echo -e "\nconda activate InverseIsing" >> ~/.bashrc

# Clone and install coniii
WORKDIR /app
RUN git clone https://github.com/Al-Borno-Lab/coniii.git && \
    cd coniii && \
    . /opt/conda/etc/profile.d/conda.sh && \
    conda activate InverseIsing && \
    ./pypi_compile.sh && \
    pip install dist/*.whl


# Create an entrypoint script that activates conda environment
RUN echo '#!/bin/bash\n\
. /opt/conda/etc/profile.d/conda.sh\n\
conda activate InverseIsing\n\
exec "$@"' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
```


### Complete Walkthrough

1. **Create a Dockerfile**
   First, create a new directory for your project and save the provided Dockerfile content:
   ```bash
   mkdir inverse-ising-project
   cd inverse-ising-project
   # Create Dockerfile and paste the content provided above
   ```

2. **Build the Docker Image**
   
   It is **very important** that you use ```--platform linux/amd64```
   ```bash
   docker build --platform linux/amd64 -t inverse-ising .
   ```
   This will take several minutes as it:
   - Downloads the base Miniconda image
   - Installs system dependencies
   - Creates the conda environment
   - Clones and builds the coniii package

3. **Tag and Push to Docker Hub**
   ```bash
   # Tag the image with your Docker Hub username
   docker tag inverse-ising your-dockerhub-username/inverse-ising:latest
   
   # Login to Docker Hub
   docker login
   
   # Push the image
   docker push your-dockerhub-username/inverse-ising:latest
   ```

4. **Build Singularity Container on Cluster**
   Once logged into the cluster, run:
   ```bash
   singularity build inverse-ising.sif docker://your-dockerhub-username/inverse-ising:latest
   ```

5. **Test the Container**
   After building, you can test the container:
   ```bash
   # Start an interactive shell
   singularity shell inverse-ising.sif
   
   # Or run a specific command
   singularity exec inverse-ising.sif ./entrypoint.sh python -c "import numpy; print(numpy.__version__)"
   ```

**Note**: When using Singularity containers built from Docker images, we need to explicitly call ```./entrypoint.sh``` before running commands 
to properly configure the environment. While Singularity natively supports environment setup in its definition files, this additional step is necessary when converting from Docker. 
If you're aware of a more streamlined approach for handling environment initialization in converted containers, please share your insights!

### Important Notes

- The container uses Python 3.10 and includes scientific computing packages
- The conda environment is automatically activated when you enter the container
- The container includes the coniii package from the Al-Borno-Lab repository
- All system dependencies (including boost libraries) are pre-installed
- The container uses OpenBLAS for optimized linear algebra operations

### Submit 

## Troubleshooting

### Common Issues

1. **Platform Support Error**
   - Ensure you've enabled Rosetta for x86/amd64 emulation in Docker Desktop
   - Try rebuilding Docker Desktop if issues persist

2. **Authentication Issues**
   - Double-check your Docker Hub credentials
   - Ensure you're logged in with `docker login`

3. **Build Failures**
   - Check your Dockerfile for compatibility with Linux/AMD64
   - Verify all dependencies are available for the target platform

## Additional Resources

- [Docker Desktop Documentation](https://docs.docker.com/desktop/)
- [Singularity Documentation](https://docs.sylabs.io/guides/3.0/user-guide/)
- [Docker Hub Documentation](https://docs.docker.com/docker-hub/) 
- Contact me if you have questions: gunnar.enserro@ucdenver.edu