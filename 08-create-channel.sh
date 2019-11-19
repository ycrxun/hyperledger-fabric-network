#!/usr/bin/env bash

clear

CLI_NAME=storage_cloud-labs_io_cli
ORDERER=orderer0.cloud-labs.io:7050
CHANNEL=alice
docker exec -it -e "ORDERER=$ORDERER" -e "CHANNEL=$CHANNEL" "$(docker ps -q -f status=running --filter name=$CLI_NAME)" sh -c 'chmod +x ./scripts/channel.tls.sh && ./scripts/channel.tls.sh create'
