#!/usr/bin/env bash

clear

FABRIC_TAG=2.0
PROFILE=SeriesChannel
CHANNEL=alice
echo "Generate channel configuration transaction"
docker run -it --rm \
  -v "$PWD":/hyperledger-fabric-network \
  -w /hyperledger-fabric-network \
  -e "FABRIC_CFG_PATH=/hyperledger-fabric-network" \
  hyperledger/fabric-tools:$FABRIC_TAG \
  sh -c "rm -f ./artifacts/config/$CHANNEL.tx && configtxgen -profile $PROFILE -outputCreateChannelTx ./artifacts/config/$CHANNEL.tx -channelID $CHANNEL"
