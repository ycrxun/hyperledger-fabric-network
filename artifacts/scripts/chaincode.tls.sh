#!/usr/bin/env bash

function install() {
  peer chaincode install -n c11 -v 1.0 -p github.com/c11
}

function instantiate() {
  peer chaincode instantiate -o orderer0.cloud-labs.io:7050 --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C alice -n c11 -v 1.0 -c '{"Args":["init","a","100","b","200"]}'
}

function query() {
    peer chaincode query -C alice -n c11 -c '{"Args":["query","a"]}'
}

function invoke() {
    peer chaincode invoke -o orderer0.cloud-labs.io:7050  --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C alice -n c11 -c '{"Args":["invoke","a","b","10"]}'
}
