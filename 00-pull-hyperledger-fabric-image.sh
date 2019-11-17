#!/usr/bin/env bash

clear

FABRIC_TAG=2.0

function pullImages() {
  for image in peer orderer ccenv tools ca; do
    echo "Pull image hyperledger/fabric-$image:$FABRIC_TAG"
    docker pull hyperledger/fabric-"$image":"$FABRIC_TAG"
    sleep 1
  done
}

echo "Pull images for hyperledger fabric network."

pullImages
