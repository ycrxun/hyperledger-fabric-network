#!/usr/bin/env bash

function install() {
  #peer chaincode install -n c11 -v 1.0 -p github.com/c11
  peer chaincode install -n "$CC_NAME" -v "$CC_VERSION" -p "$CC_PATH"
}

function instantiate() {
  #peer chaincode instantiate -o orderer0.cloud-labs.io:7050 -C alice -n c11 -v 1.0 -c '{"Args":["init","a","100","b","200"]}' --tls "$CORE_PEER_TLS_ENABLED" --cafile "$ORDERER_CA"
  peer chaincode instantiate -o "$ORDERER" -C "$CHANNEL" -n "$CC_NAME" -v "$CC_VERSION" -c "$CC_CTR" --tls "$CORE_PEER_TLS_ENABLED" --cafile "$ORDERER_CA"
}

function query() {
  #peer chaincode query -C alice -n c11 -c '{"Args":["query","a"]}'
  peer chaincode query -C "$CHANNEL" -n "$CC_NAME" -c "$CC_QUERY_ARG"
}

function invoke() {
  #peer chaincode invoke -o orderer0.cloud-labs.io:7050 -C alice -n c11 -c '{"Args":["invoke","a","b","10"]}' --tls "$CORE_PEER_TLS_ENABLED" --cafile "$ORDERER_CA"
  peer chaincode invoke -o "$ORDERER" -C "$CHANNEL" -n "$CC_NAME" -c "$CC_INVOKE_ARG" --tls "$CORE_PEER_TLS_ENABLED" --cafile "$ORDERER_CA"
}

function install_list() {
    peer chaincode list --installed -C "$CHANNEL"
}

function instantiate_list() {
    peer chaincode list --instantiated -C "$CHANNEL"
}

fn=$1
${fn}
