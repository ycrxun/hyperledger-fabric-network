#!/usr/bin/env bash

clear

FABRIC_TAG=2.0

echo "Generate genesis block for orderer"
docker run -it \
  -v $PWD:/hyperledger-fabric-network \
  -w /hyperledger-fabric-network \
  -e "FABRIC_CFG_PATH=/hyperledger-fabric-network" \
  hyperledger/fabric-tools:$FABRIC_TAG \
  configtxgen -profile OrdererGenesis -outputBlock ./artifacts/config/genesis.block
