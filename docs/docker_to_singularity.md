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