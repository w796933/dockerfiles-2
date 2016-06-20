## docker-shadowsocks

[Shadowsocks-libev] is a lightweight, secure SOCKS5 proxy for embedded devices and low-end boxes.

Download shadowsocks [clients] for your devices.

[Shadowsocks-libev]:https://github.com/shadowsocks/shadowsocks-libev#readme
[clients]:https://shadowsocks.org/en/download/clients.html

## Notes

 * The default server and local ports are 8388 and 1080.

 * Environment variables: `/etc/sysconfig/containers/shadowsocks/NAME`

 * Config file: `/etc/shadowsocks/NAME/config.json`

## Install

```
atomic install --name=server oszi/shadowsocks
```

Manually on any distribution:

```
export IMAGE=oszi/shadowsocks NAME=server
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now shadowsocks@${NAME}
```

## Client Usage

```
docker run --rm -p=127.0.0.1:1080:1080/{tcp,udp} oszi/shadowsocks \
ss-local -s $SERVER -p 8388 -k $PASSWORD -m chacha20-ietf \
-b 0.0.0.0 -l 1080 -u -A --fast-open
```
