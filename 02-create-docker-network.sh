#!/usr/bin/env bash

clear

DOCKER_NETWORK_NAME=baas
echo "Create docker network $DOCKER_NETWORK_NAME"
docker network create --driver overlay --subnet=10.200.1.0/24 --attachable "$DOCKER_NETWORK_NAME"
