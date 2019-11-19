#!/usr/bin/env bash

STACK_NAMES=(storage_cloud-labs_io vhost_cloud-labs_io cloud-labs_io)

for st in "${STACK_NAMES[@]}"; do
  docker stack rm "$st"
done

sleep 5

echo y | docker container prune

echo y | docker volume prune
