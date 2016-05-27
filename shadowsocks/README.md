## docker-shadowsocks-libev

[Shadowsocks](https://shadowsocks.org) - A secure socks5 proxy,
designed to protect your Internet traffic.

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

Download [clients] for your devices.

See [Best Route Table] for optimized routing tables.

[Advanced Usage]\: Use ss-redir to proxy all traffic transparently.

[clients]:https://shadowsocks.org/en/download/clients.html
[Advanced Usage]:https://github.com/shadowsocks/shadowsocks-libev#advanced-usage
[Best Route Table]:https://github.com/ashi009/bestroutetb

## Client Usage

```
docker run --rm -p=127.0.0.1:1080:1080/{tcp,udp} oszi/shadowsocks \
ss-local -s $SERVER -p 8388 -k $PASSWORD -m aes-128-cfb \
-b 0.0.0.0 -l 1080 -u --fast-open
```
