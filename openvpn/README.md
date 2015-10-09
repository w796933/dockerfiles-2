## docker-openvpn

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/openvpn/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/openvpn)

Docker image for OpenVPN - includes Easy-RSA3.

## Setup

Drop into a shell:

```
docker run -it --rm -v /path/to/openvpn:/etc/openvpn:Z quay.io/oszi/openvpn bash
```

Set up Easy-RSA and server.conf:

```
rsync -av --exclude easyrsa /usr/share/easy-rsa/easyrsa3 ./
mv easyrsa3/vars{.example,}
easyrsa -h
```

## Usage

Start OpenVPN with server.conf:

```
docker run --rm --name openvpn --cap-add NET_ADMIN -p 1194:1194/udp \
-v /path/to/openvpn:/etc/openvpn:Z quay.io/oszi/openvpn
```

You need to take care of firewall rules outside the container.
