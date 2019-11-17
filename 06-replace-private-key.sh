#!/usr/bin/env bash

clear

CURRENT_DIR=$PWD

####
####
cd ./artifacts/crypto-config/peerOrganizations/storage.cloud-labs.io/ca
PRIV_KEY=$(ls *_sk)
cd "$CURRENT_DIR"
CA_KEYFILE=$(cat docker-compose-storage.yaml | grep _sk | grep "/ca/")
CA_KEY=${CA_KEYFILE##*/ca/}
sed -i "s/${CA_KEY}/${PRIV_KEY}/g" docker-compose-storage.yaml

cd ./artifacts/crypto-config/peerOrganizations/storage.cloud-labs.io/tlsca
TLS_PRIV_KEY=$(ls *_sk)
cd "$CURRENT_DIR"
TLS_CA_KEYFILE=$(cat docker-compose-storage.yaml | grep _sk | grep "/tlsca/")
TLS_CA_KEY=${TLS_CA_KEYFILE##*/tlsca/}
sed -i "s/${TLS_CA_KEY}/${TLS_PRIV_KEY}/g" docker-compose-storage.yaml

######
######
cd ./artifacts/crypto-config/peerOrganizations/vhost.cloud-labs.io/ca
PRIV_KEY=$(ls *_sk)
cd "$CURRENT_DIR"
CA_KEYFILE=$(cat docker-compose-vhost.yaml | grep _sk | grep "/ca/")
CA_KEY=${CA_KEYFILE##*/ca/}
sed -i "s/${CA_KEY}/${PRIV_KEY}/g" docker-compose-vhost.yaml

cd ./artifacts/crypto-config/peerOrganizations/vhost.cloud-labs.io/tlsca
TLS_PRIV_KEY=$(ls *_sk)
cd "$CURRENT_DIR"
TLS_CA_KEYFILE=$(cat docker-compose-vhost.yaml | grep _sk | grep "/tlsca/")
TLS_CA_KEY=${TLS_CA_KEYFILE##*/tlsca/}
sed -i "s/${TLS_CA_KEY}/${TLS_PRIV_KEY}/g" docker-compose-vhost.yaml
