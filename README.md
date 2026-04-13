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

IP Forwarding is enabled on the wireguard server and the wireguard client.

# Containers

- wryon_wireguard_server - Wireguard server
- wryon_wireguard_client - Wireguard client
- wryon_alice - Test curl client
- wryon_bob - Test nginx server
