# Docker Test

This repository contains sample Docker files for testing Docker images and containers.

## Build Docker Image

To build a Docker image named `docker-test` using the Dockerfile located in the root directory, run the following command:

```bash
docker build -t docker-test .
```

## Push Docker Image

Follow these steps to push the Docker image to Docker Hub:

1. Login to Docker Hub and create a new empty repository.
2. Rebuild the Docker image using the naming convention: {account name}/docker-test.
   ```bash
   docker build -t {account_name}/docker-test .
   ```
3. Run the command below to push the local image to the docker hub.
   ```bash
   docker push {account name}/docker-test
   ```

## Pull Docker Image

To pull the Docker image from Docker Hub, run:

```bash
docker pull {account name}/docker-test
```

## Run Docker Container

To run a Docker container from the image and display "Hello World!", execute:

```bash
docker run {account name}/docker-test
```
