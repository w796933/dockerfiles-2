## docker-samba

Docker image for [Samba](https://www.samba.org) servers and clients.

## Notes

 * Environment variables will be parsed as options...

 * ...prefix with SMBD_ for smbd, NMBD_ for nmbd or SAMBA_ for both...

 * ...and whitespace characters must be escaped.

 * You can set the environment variables in `/etc/sysconfig/containers/samba/samba`.

 * Logs are redirected to stdout.

## Install

```
atomic install oszi/samba
```

Manually on any distribution:

```
export IMAGE=oszi/samba NAME=samba
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```
