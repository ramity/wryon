# Wryon

A proof of concept for a distributed system that can be used to run containers on remote machines.

# Example

```bash
docker exec -t wryon_alice curl -I 10.13.13.1
```

> Alice curls Bob's nginx server over the wireguard tunnel.

# Networking

- 10.13.13.0/24 - Wireguard tunnel
- 10.13.13.1 - Wireguard server
- 10.13.13.2 - Wireguard client
- 10.13.13.3 - Wireguard client

# Containers

## Server
- wryon_wireguard_server - Wireguard server
- wryon_bob - Test nginx server

## Client
- wryon_wireguard_client - Wireguard client
- wryon_alice - Test curl client

Wryon_bob attaches to the wryon_wireguard_server container using network_mode: service:wryon_wireguard_server.
Wryon_alice attaches to the wryon_wireguard_client container using network_mode: service:wryon_wireguard_client.

Wryon_wireguard_server is accessible via port 51820/udp on the host machine.
Wryon_wireguard_client connects to wryon_wireguard_server via wireguard server port 51820/udp. 
