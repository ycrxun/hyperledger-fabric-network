#!/usr/bin/env bash

clear

CURRENT_DIR=$PWD
ORGS=(storage.cloud-labs.io vhost.cloud-labs.io)
for org in "${ORGS[@]}"; do
  cd "./artifacts/crypto-config/peerOrganizations/$org/ca" || exit
  PRIV_KEY=$(ls -- *_sk)
  cd "$CURRENT_DIR" || exit
  CA_KEYFILE=$(cat <"docker-compose-${org%%.*}.yaml" | grep _sk | grep "/ca/")
  CA_KEY=${CA_KEYFILE##*/ca/}
  sed -i "s/${CA_KEY}/${PRIV_KEY}/g" "docker-compose-${org%%.*}.yaml"

  cd "./artifacts/crypto-config/peerOrganizations/$org/tlsca" || exit
  TLS_PRIV_KEY=$(ls -- *_sk)
  cd "$CURRENT_DIR" || exit
  TLS_CA_KEYFILE=$(cat <"docker-compose-${org%%.*}.yaml" | grep _sk | grep "/tlsca/")
  TLS_CA_KEY=${TLS_CA_KEYFILE##*/tlsca/}
  sed -i "s/${TLS_CA_KEY}/${TLS_PRIV_KEY}/g" "docker-compose-${org%%.*}.yaml"
done
