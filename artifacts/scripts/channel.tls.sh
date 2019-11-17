#!/usr/bin/env bash

#
# retry function
#
function retry() {
  local n=0
  local try=$1
  local cmd="${@: 2}"
  [[ $# -le 1 ]] && {
    echo "Usage $0 <retry_number> <cmd>"
  }
  until [ $n -ge "$try" ]; do
    $cmd && break || {
      echo "Exec '$cmd' failed..."
      ((n++))
      echo "retry $n ::"
      sleep 1
    }
  done
}

#
# create channel
#
function create() {
  retry 5 peer channel create -o orderer0.cloud-labs.io:7050 -c alice -f ./config/alice.tx --outputBlock ./config/alice.block --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

function join() {
  retry 5 peer channel join -b ./alice.block
}
