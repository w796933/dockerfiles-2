## docker-samba

Docker image for [Samba](https://www.samba.org) servers and clients.

## Notes

 * Environment variables will be parsed as options...

 * ...prefix with SMBD_ for smbd, NMBD_ for nmbd or SAMBA_ for both...

 * ...and whitespace characters must be escaped.

 * You can change the service environment variables in systemd drop-ins.

 * Logs are redirected to stdout.

## Test run

Start a container without touching the host system:

```
atomic run --opt1="--net=host" oszi/samba
atomic run oszi/samba nmbd &
```

Manually on any distribution:

```
export IMAGE="oszi/samba"
export NAME="samba"
docker pull ${IMAGE}
eval $(docker inspect -f "{{.Config.Labels.RUN}}" ${IMAGE})
docker exec ${NAME} nmbd &
```

Your data persists only until the container exists.

## Install

```
atomic install oszi/samba
```

Manually on any distribution:

```
export IMAGE="oszi/samba"
docker pull ${IMAGE}
eval $(docker inspect -f "{{.Config.Labels.INSTALL}}" ${IMAGE})
```
