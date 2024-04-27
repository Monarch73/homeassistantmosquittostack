# Home Assistant and Mosquitto Docker Stack

This project uses Docker Compose to run a Home Assistant and Mosquitto MQTT broker stack.

## Services

Homeassistant is exposed via http on port 8123 and the mqtt-broker exposed on port 1883

### Home Assistant

Home Assistant is an open-source home automation platform that focuses on privacy and local control. In this stack, it's running in a Docker container using the image from the GitHub Container Registry (`ghcr.io/home-assistant/home-assistant:stable`).

The Home Assistant configuration files are stored in the `/container/homeassistant` directory on the host, which is mounted to `/config` in the container. The local time and D-Bus system message bus are also shared with the container.

The container is configured to restart unless manually stopped, runs with privileged access, and uses the host's network stack.

### Mosquitto Dockerfile

The Mosquitto service is built from a Dockerfile. Here's a brief overview of what the Dockerfile does:

- It starts from the `alpine:edge` image, which is a lightweight Linux distribution.
- It labels the image with the maintainer's name and a description.
- It installs the `mosquitto` and `mosquitto-clients` packages.
- It exposes port 1883 for MQTT communication.
- It adds a `mosquitto.conf` configuration file to the root directory.
- It sets the `PATH` environment variable to include `/usr/sbin`.
- It changes the user to `nobody`.
- It sets the entrypoint to run Mosquitto with the added configuration file.

The `mosquitto.conf` file is configured to allow anonymous access to the MQTT server.

## Running the Stack

To start the stack, navigate to the directory containing the `docker-compose.yaml` file and run the following command:

```bash
docker-compose up -d
```
