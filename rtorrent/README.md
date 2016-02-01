## docker-rtorrent

The [rTorrent](https://github.com/rakshasa/rtorrent) BitTorrent client
with the [ruTorrent](https://github.com/Novik/ruTorrent) WebUI.

## Notes

 * The default published HTTP port is 8080.

 * The default user:password is rtorrent:rtorrent in `/data/.rutorrent/htpasswd`.

 * You can change the service environment variables in systemd drop-ins.

 * For multiple instances you have to override the port variables...

 * SSL should be configured by a reverse proxy for public access.

 * All logs are redirected to stdout.

## Install

```
atomic install --name=rt1 oszi/rtorrent
```

Manually on any distribution:

```
export IMAGE=oszi/rtorrent
export NAME=rt1
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```
