#!/usr/bin/env bash

clear

CLI_NAME=storage_cloud-labs_io_cli
ORDERER=orderer0.cloud-labs.io:7050
CHANNEL=alice
CC_NAME=c11
CC_QUERY_ARG='{"Args":["query","a"]}'

CID=$(docker ps -q -f status=running --filter name="$CLI_NAME")
docker exec -it \
  -e "ORDERER=$ORDERER" \
  -e "CHANNEL=$CHANNEL" \
  -e "CC_NAME=$CC_NAME" \
  -e "CC_QUERY_ARG=$CC_QUERY_ARG" \
  "$CID" sh -c 'chmod +x ./scripts/chaincode.tls.sh && ./scripts/chaincode.tls.sh query'
