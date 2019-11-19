#!/usr/bin/env bash

CLI_NAME=storage_cloud-labs_io_cli
ORDERER=orderer0.cloud-labs.io:7050
CHANNEL=alice
CC_NAME=c11
CC_INVOKE_ARG='{"Args":["invoke","a","b","10"]}'
CID=$(docker ps -q -f status=running --filter name="$CLI_NAME")
docker exec -it \
  -e "ORDERER=$ORDERER" \
  -e "CHANNEL=$CHANNEL" \
  -e "CC_NAME=$CC_NAME" \
  -e "CC_INVOKE_ARG=$CC_INVOKE_ARG" \
  "$CID" sh -c 'chmod +x ./scripts/chaincode.tls.sh && ./scripts/chaincode.tls.sh invoke'
