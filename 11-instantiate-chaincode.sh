#!/usr/bin/env bash

clear

CLI_NAMES=(storage_cloud-labs_io_cli vhost_cloud-labs_io_cli)
ORDERER=orderer0.cloud-labs.io:7050
CHANNEL=alice
CC_NAME=c11
CC_VERSION=1.0
CC_CTR='{"Args":["init","a","100","b","200"]}'
for cli in "${CLI_NAMES[@]}"; do
  CID=$(docker ps -q -f status=running --filter name="$cli")
  docker exec -it \
    -e "ORDERER=$ORDERER" \
    -e "CHANNEL=$CHANNEL" \
    -e "CC_NAME=$CC_NAME" \
    -e "CC_VERSION=$CC_VERSION" \
    -e "CC_CTR=$CC_CTR" \
    "$CID" sh -c 'chmod +x ./scripts/chaincode.tls.sh && ./scripts/chaincode.tls.sh instantiate && ./scripts/chaincode.tls.sh instantiate_list'
done
