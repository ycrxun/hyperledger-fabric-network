#!/usr/bin/env bash

clear

FABRIC_TAG=2.0

echo "Generate crypto material"
docker run -it \
  -v "$PWD":/hyperledger-fabric-network \
  -w /hyperledger-fabric-network \
  -e "FABRIC_CFG_PATH=/hyperledger-fabric-network" \
  hyperledger/fabric-tools:$FABRIC_TAG \
  sh -c "rm -rf ./artifacts/crypto-config/* && cryptogen generate --config=./crypto-config.yaml --output=./artifacts/crypto-config"
