#!/usr/bin/env bash

clear

FABRIC_TAG=2.0
PROFILE=OrdererGenesis
echo "Generate genesis block for orderer"
docker run -it \
  -v "$PWD":/hyperledger-fabric-network \
  -w /hyperledger-fabric-network \
  -e "FABRIC_CFG_PATH=/hyperledger-fabric-network" \
  hyperledger/fabric-tools:$FABRIC_TAG \
  sh -c "rm -f ./artifacts/config/genesis.block && configtxgen -profile $PROFILE -outputBlock ./artifacts/config/genesis.block -channelID syschain"
