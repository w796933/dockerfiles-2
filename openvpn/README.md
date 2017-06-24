## docker-openvpn

Docker image for OpenVPN - includes Easy-RSA3.

## Usage

[Script](artifacts/shell.sh) for interactive management:

```
shell.sh [command]
```

You can create a `pre-up.sh` file to be executed before startup.

Start OpenVPN with server.conf:

```
docker run --rm --name=openvpn --cap-add=NET_ADMIN -p 1194:1194/udp \
-v /etc/openvpn:/etc/openvpn:Z oszi/openvpn --config server.conf
```
