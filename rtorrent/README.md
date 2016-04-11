## docker-rtorrent

The [rTorrent] BitTorrent client with the [ruTorrent] WebUI.

[rTorrent]:https://github.com/rakshasa/rtorrent
[ruTorrent]:https://github.com/Novik/ruTorrent

## Notes

 * The default published HTTP port is 8080.

 * The default user:password is rtorrent:rtorrent in `/data/.htpasswd`.

 * For multiple instances you have to change the port variables...

 * You can set the environment variables in `/etc/sysconfig/containers/rtorrent/NAME`.

 * SSL should be configured by a reverse proxy for public access.

 * All logs are redirected to stdout.

## Install

```
atomic install --name=rt1 oszi/rtorrent
```

Manually on any distribution:

```
export IMAGE=oszi/rtorrent NAME=rt1
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```
