#!/usr/bin/env bash
clear
CLI_NAMES=(storage_cloud-labs_io_cli vhost_cloud-labs_io_cli)
ORDERER=orderer0.cloud-labs.io:7050
CHANNEL=alice
for cli in "${CLI_NAMES[@]}"; do
  docker exec -it -e "ORDERER=$ORDERER" -e "CHANNEL=$CHANNEL" "$(docker ps -q -f status=running --filter name="$cli")" sh -c 'chmod +x ./scripts/channel.tls.sh && ./scripts/channel.tls.sh join'
done
