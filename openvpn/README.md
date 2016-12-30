## docker-openvpn

Docker image for OpenVPN - includes Easy-RSA3.

## Usage

Start OpenVPN with server.conf:

```
docker run --rm --name=openvpn --cap-add=NET_ADMIN -p 1194:1194/udp \
-v /etc/openvpn:/etc/openvpn:Z oszi/openvpn:$TAG --config server.conf
```

You need to take care of firewall rules outside of the container or in `pre-up.sh`.

[Script](artifacts/openvpn-shell.sh) for configuration management purposes:

```
openvpn-shell <name> [easyrsa]
```

\* Does not share namespaces with the service container.

## Install

```
atomic install --name=openvpn-udp oszi/openvpn:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/openvpn:$TAG NAME=openvpn-udp
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now openvpn-udp
```

You can create a `pre-up.sh` file to be executed before startup.
