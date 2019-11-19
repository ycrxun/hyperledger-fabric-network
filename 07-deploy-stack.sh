#!/usr/bin/env bash

docker stack deploy -c docker-compose-storage.yaml storage_cloud-labs_io
sleep 1
docker stack deploy -c docker-compose-vhost.yaml vhost_cloud-labs_io
sleep 1
docker stack deploy -c docker-compose-orderer.yaml cloud-labs_io

sleep 2
docker stack ls
