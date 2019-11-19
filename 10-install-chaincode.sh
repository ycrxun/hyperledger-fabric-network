#!/usr/bin/env bash
clear
CLI_NAMES=(storage_cloud-labs_io_cli vhost_cloud-labs_io_cli)
ORDERER=orderer0.cloud-labs.io:7050
CHANNEL=alice
CC_NAME=c11
CC_VERSION=1.0
CC_PATH=github.com/c11
for cli in "${CLI_NAMES[@]}"; do
  CID=$(docker ps -q -f status=running --filter name="$cli")
  docker exec -it \
    -e "ORDERER=$ORDERER" \
    -e "CHANNEL=$CHANNEL" \
    -e "CC_NAME=$CC_NAME" \
    -e "CC_VERSION=$CC_VERSION" \
    -e "CC_PATH=$CC_PATH" \
    "$CID" sh -c 'chmod +x ./scripts/chaincode.tls.sh && ./scripts/chaincode.tls.sh install && ./scripts/chaincode.tls.sh install_list'
done
