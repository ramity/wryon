# Wryon

A proof of concept for a distributed system that can be used to run containers on remote machines.

# Networking

| IP Address | Name | Container |
| --- | --- | --- |
| 10.13.13.0/24 | Wireguard tunnel subnet | - |
| 10.13.13.1 | Wireguard server | `wryon_wg_server` |
| 10.13.13.2 | Wireguard client 1 | `wryon_wg_client_1` |
| 10.13.13.2 | Alice | `wryon_alice` |
| 10.13.13.2 | SSH Client | `wryon_charlie` |
| 10.13.13.3 | Wireguard client 2 | `wryon_wg_client_2` |
| 10.13.13.3 | Bob | `wryon_bob` |
| 10.13.13.3 | SSH Server | `wryon_ssh_server` |

# Containers

## Server
- `wryon_wg_server` - Wireguard server

## Client 1
- `wryon_wg_client_1` - Wireguard client
- `wryon_alice` - Test curl client
- `wryon_charlie` - Test ssh client

## Client 2
- `wryon_wg_client_2` - Wireguard client
- `wryon_bob` - Test nginx server
- `wryon_ssh_server` - Test ssh server

## Testing

- Exec into wryon_alice and run curl bob's nginx server
```bash
docker exec wryon_alice curl 10.13.13.3
```

- Exec into wryon_charlie and run ssh to wryon_ssh_server
```bash
docker exec wryon_charlie ssh ramity@10.13.13.3 -p 2222 -vvv
```

- scripts/test.sh was used when pinging was required to refresh the UDP connection that would otherwise time out. The use of a KeepAlive setting has since been implemented.
