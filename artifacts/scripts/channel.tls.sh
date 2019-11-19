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
  retry 5 peer channel create -o "$ORDERER" -c "$CHANNEL" -f ./config/"$CHANNEL".tx --outputBlock ./config/"$CHANNEL".block --tls "$CORE_PEER_TLS_ENABLED" --cafile "$ORDERER_CA"
}

#
# join channel
#
function join() {
  retry 5 peer channel join -b ./config/"$CHANNEL".block
}

function list() {
    peer channel list
}

fn=$1
${fn}
