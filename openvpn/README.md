## docker-openvpn

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/openvpn/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/openvpn)

Docker image for OpenVPN - includes Easy-RSA3.

## Setup

Drop into a shell:

```
docker run -it --rm -v /etc/openvpn:/etc/openvpn:Z --entrypoint bash quay.io/oszi/openvpn
```

Set up Easy-RSA and server.conf:

```
easyrsa init-pki
cp -v ${EASYRSA}/vars.example ${EASYRSA_PKI}/vars
touch server.conf
easyrsa -h
```

You can create a `pre-up.sh` file to be executed before startup.

## Usage

Start OpenVPN with server.conf:

```
docker run --rm --name openvpn --cap-add NET_ADMIN -p 1194:1194/udp \
-v /etc/openvpn:/etc/openvpn:Z quay.io/oszi/openvpn
```

You need to take care of firewall rules outside of the container or in pre-up.sh.
