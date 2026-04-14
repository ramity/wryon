# Wryon

A proof of concept for a distributed system that can be used to run containers on remote machines.

# Networking

| IP Address | Name | Container |
| --- | --- | --- |
| 10.13.13.0/24 | Wireguard tunnel subnet | - |
| 10.13.13.1 | Wireguard server | `wryon_wg_server` |
| 10.13.13.2 | Wireguard client 1 | `wryon_wg_client_1` |
| 10.13.13.2 | Alice | `wryon_alice` |
| 10.13.13.3 | Wireguard client 2 | `wryon_wg_client_2` |
| 10.13.13.3 | Bob | `wryon_bob` |

# Containers

## Server
- `wryon_wg_server` - Wireguard server

## Client 1
- `wryon_wg_client_1` - Wireguard client
- `wryon_alice` - Test curl client - network_mode: service:wryon_wg_client_1

## Client 2
- `wryon_wg_client_2` - Wireguard client
- `wryon_bob` - Test nginx server - network_mode: service:wryon_wg_client_2
