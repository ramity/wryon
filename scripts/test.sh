#!/bin/bash

# Start from a completely clean slate
# docker compose down --rmi local && docker compose up -d --force-recreate --remove-orphans

# Ping to server from alice
docker exec -t wryon_alice ping -c 4 10.13.13.1

# Ping to server from bob
docker exec -t wryon_bob ping -c 4 10.13.13.1

# Curl to bob from alice
docker exec -t wryon_alice curl 10.13.13.3
