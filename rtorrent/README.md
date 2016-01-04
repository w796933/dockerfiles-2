## docker-rtorrent

The [rTorrent](https://github.com/rakshasa/rtorrent) BitTorrent client
with the [ruTorrent](https://github.com/Novik/ruTorrent) WebUI.

## Notes

 * The default published HTTP port is 8080.

 * The default user:password is rtorrent:rtorrent in `/data/.rutorrent/htpasswd`.

 * You can add more mount points with the $OPTIONS environment variable in a systemd drop-in.

 * SSL should be configured by a reverse proxy for public access.

 * All logs are redirected to stdout.

 * Multiple instances (service templates) are not supported yet.

## Test run

Start a container without touching the host system:

```
atomic run --opt1=8080 oszi/rtorrent
```

Manually on any distribution:

```
export IMAGE="oszi/rtorrent"
export NAME="rtorrent"
docker pull ${IMAGE}
eval $(docker inspect -f "{{.Config.Labels.RUN}}" ${IMAGE})
```

Your data persists only until the container exists.

## Install

```
atomic install oszi/rtorrent
```

Manually on any distribution:

```
export IMAGE="oszi/rtorrent"
docker pull ${IMAGE}
eval $(docker inspect -f "{{.Config.Labels.INSTALL}}" ${IMAGE})
```
