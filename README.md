# Shoggoth Docker Project

This project sets up a Shoggoth Node using Docker and Docker Compose. It is designed to be simple to set up and run, encapsulating all necessary configurations and dependencies.

## Requirements

- Docker
- Docker Compose

## Setup and Installation

1. **Clone the Repository:**
   - Ensure you have the `Dockerfile` and `docker-compose.yml` files in your project directory.
   - Run `git clone https://github.com/name/shoggoth-docker.git` to clone the repository.

2. **Build the Docker Image:**
   - Run `docker-compose build` to build the Shoggoth Docker image.

3. **Start the Container:**
   - Run `docker-compose up -d` to start the Shoggoth container in detached mode.

4. **Accessing the Shoggoth Node:**
   - The Shoggoth Node will be running inside the container named `shoggoth-node`.

## Configuration

To modify the Shoggoth Node configuration:

1. **Enter the Container:**
   - Run `docker exec -it shoggoth-node bash` to access the bash shell inside the container.

2. **Install a Text Editor (if not present):**
   - Run `apt-get install vim` to install Vim. You can use any other text editor of your choice.

3. **Edit the Configuration File:**
   - Run `vi /root/shoggoth/node/config.toml` to edit the configuration file.
   - Make necessary changes as per the [Shoggoth documentation](https://shoggoth.network/explorer/docs).

4. **Restart the Shoggoth Node:**
   - Run `shog node stop` and then `shog node start` to restart the node with the new configuration.

5. **Exit the Container:**
   - Type `exit` to leave the container's shell.

## Ports and Networking

- By default, the Shoggoth Node's port `6969` is not exposed. 
- If you need to access the web interface directly, uncomment the `ports` section in the `docker-compose.yml` file.

## Data Persistence

- Data for the Shoggoth Node is persisted in a Docker volume named `shoggoth_data`.
- This ensures that your data remains intact across container restarts and removals.

## Troubleshooting

- Ensure Docker and Docker Compose are properly installed and up to date.
- Check the container logs using `docker logs shoggoth-node` for any errors or issues.
