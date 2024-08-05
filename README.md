# Silica Dedicated Server Docker Setup

This repository provides a Docker setup for running the Silica dedicated server on Ubuntu 24.04. It uses Docker Compose to simplify the setup and management of the server, allowing you to configure server settings through environment variables.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Technical Details](#technical-details)
- [Game Information](#game-information)
- [License](#license)

## Prerequisites

- Docker
- Docker Compose

## Installation

1. Clone this repository:
    ```sh
    git clone https://github.com/yourusername/silica-server-docker.git
    cd silica-server-docker
    ```

2. Build the Docker image and start the container using Docker Compose:
    ```sh
    docker-compose up --build
    ```

## Configuration

The server settings are configured using environment variables defined in the `docker-compose.yml` file. The following environment variables are used to customize the `ServerSettings.xml` file:

- `SERVER_NAME`: The name of the server.
- `CURRENT_GAME_MODE`: The current game mode.
- `SINGLEPLAYER`: Set to `false` for multiplayer.
- `PASSWORD_PROTECTED`: Whether the server is password protected.
- `SERVER_PASSWORD`: The server password.
- `GAME_PORT`: The game port.
- `QUERY_PORT`: The query port.
- `DEATHMATCH_MAP`: The current map for deathmatch mode.
- `DEATHMATCH_MAP_LIST`: The map list for deathmatch mode.
- `DEATHMATCH_MAX_PLAYERS`: Maximum players for deathmatch mode.
- `PROSPECTOR_MAP`: The current map for prospector mode.
- `PROSPECTOR_MAP_LIST`: The map list for prospector mode.
- `PROSPECTOR_MAX_PLAYERS`: Maximum players for prospector mode.
- `SANDBOX_MAP`: The current map for sandbox mode.
- `SANDBOX_MAP_LIST`: The map list for sandbox mode.
- `SANDBOX_MAX_PLAYERS`: Maximum players for sandbox mode.
- `STRATEGY_MAP`: The current map for strategy mode.
- `STRATEGY_MAP_LIST`: The map list for strategy mode.
- `STRATEGY_MAX_PLAYERS`: Maximum players for strategy mode.
- `TOWER_DEFENSE_MAP`: The current map for tower defense mode.
- `TOWER_DEFENSE_MAP_LIST`: The map list for tower defense mode.
- `TOWER_DEFENSE_MAX_PLAYERS`: Maximum players for tower defense mode.

Edit the `docker-compose.yml` file to set these variables according to your requirements.

## Usage

To start the Silica server, simply run:

```sh
docker-compose up --build
```

This command will build the Docker image (if not already built) and start the container. The server settings will be configured based on the environment variables defined in the `docker-compose.yml` file.

To stop the server, use:

```sh
docker-compose down
```

## Technical Details

- **Base Image**: The Dockerfile uses `ubuntu:24.04` as the base image.
- **SteamCMD**: SteamCMD is used to download and install the Silica server.
- **Configuration**: A template for the `ServerSettings.xml` file is used, with placeholders replaced by environment variables at runtime using `envsubst`.
- **Entrypoint**: The `entrypoint.sh` script handles the replacement of placeholders in the `ServerSettings.xml` file and starts the Silica server.
- **Ports**: The server exposes ports `26900` and `26901`. These ports can be mapped to the host machine in the `docker-compose.yml` file.

## Game Information

You can find and buy the Silica game on Steam at the following link: [Silica on Steam](https://store.steampowered.com/app/1494420/Silica/)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
