## docker-shadowsocks

[Shadowsocks-libev] is a lightweight, secure SOCKS5 proxy for embedded devices and low-end boxes.

Download shadowsocks [clients] for your devices.

[Shadowsocks-libev]:https://github.com/shadowsocks/shadowsocks-libev
[clients]:https://shadowsocks.org/en/download/clients.html

## Notes

* Requires the `NET_BIND_SERVICE` capability and a supported filesystem.
* To avoid the docker proxy use `host` network mode.

## Simple Client Usage

```
docker run --rm -p=127.0.0.1:1080:1080/{tcp,udp} oszi/shadowsocks \
ss-local -s $SERVER -p 8388 -k $PASSWORD -m $CIPHER \
-b 0.0.0.0 -l 1080 -u --fast-open
```
