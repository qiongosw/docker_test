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

## Use docker Compose

We can run docker containers with additional parameters, such as port and volume. But typing these parameters whenever we need to run a docker container is laborious. Docker compose configuration file can store the additional parameters and their values. A example of docker compose file `compose.yaml` is created in the working directory. Use the following command to activate the compose file:

```bash
docker compose -f compose.yaml up --build
```

## Debug in Docker Environment

There are a few approaches to debug in the Docker environment.

### Direct Debugging from Docker Terminal with pdb

1. Start the container:

   ```bash
   docker exec -it <container_id>
   ```

2. Start Python with pdb:

   ```bash
   python -m pdb your_script.py
   ```

3. Set breakpoints in the terminal:

   ```bash
   break your_script.py:20  # Set breakpoint at line 20
   continue
   ```

4. Step through the code with following commands:
   | Command | Description |
   | ------- | ------- |
   | c | Continue execution |  
   | n | Next step |
   | s | Step into function |
   | q | Quit |

### Using debugpy for Remote Debugging

1. Install debugpy in the Docker Container

   Add debugpy to your requirements.txt or install it manually:

2. Modify the Python Script to Include debugpy

   Add the following code at the beginning of your Python script:

   ```python
   import debugpy

   # Allow connection from any IP (0.0.0.0)
   debugpy.listen(("0.0.0.0", 5678))
   print("Waiting for debugger to attach...")
   debugpy.wait_for_client() # Wait until debugger is attached
   print("Debugger attached.")
   ```

   The above code will:

   - Start a debug server on port 5678.
   - Wait for a debugger (like VSCode) to attach.

3. Expose the Debug Port in Docker

   Update your docker-compose.yml and Dockerfile:

   ```yaml
   ports:
     - "5678:5678" # Expose the debug port
   ```

4. Start the Docker Container
   ```bash
   docker-compose up --build
   ```
5. Attach VSCode to the Running Docker Container
   Open VSCode.

   - Go to "Run and Debug" tab → "Create a launch.json". An example launch.json can be found in `.vscode/launch.json`.

   - Start debugging in VSCode:
     1. Open Run and Debug Panel
     2. Select "Python: Remote Attach"
     3. Start Debugging → It will connect to the running container

6. Set Breakpoints in VSCode

```

```
