## docker-openvpn

Docker image for OpenVPN - includes Easy-RSA3.

## Usage

Start OpenVPN with server.conf:

```
docker run --rm --name=openvpn --cap-add=NET_ADMIN -p 1194:1194/udp \
-v /etc/openvpn:/etc/openvpn:Z oszi/openvpn
```

You need to take care of firewall rules outside of the container or in `pre-up.sh`.

[Script](artifacts/openvpn-shell.sh) for configuration management purposes:

```
openvpn-shell <name> [easyrsa]
```

\* Does not share namespaces with the service container.

## Install

```
atomic install -n server oszi/openvpn
```

Manually on any distribution:

```
export IMAGE=oszi/openvpn NAME=server
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now openvpn@server
```

You can create a `pre-up.sh` file to be executed before startup.
