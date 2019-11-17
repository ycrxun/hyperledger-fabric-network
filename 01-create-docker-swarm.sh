#!/usr/bin/env bash

clear
echo "Leave old swarm network."
docker swarm leave
echo "Init new swarm network."
docker swarm init
