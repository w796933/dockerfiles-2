## docker-nginx

[Nginx](http://nginx.org/en/) high-performance HTTP server and reverse proxy.

## Notes

Environment file: `/etc/sysconfig/containers/NAME`

Configuration directory: `/etc/containers/NAME` mounted as `/etc/nginx`.

Data directory: `DATADIR` mounted at the same location.

The default configuration files are adapted to containerized environments.

The container runs with a non-privileged user so nginx cannot bind to ports below 1024.
Setting the cap_net_bind_service capability on the nginx binary could solve this problem
but not all storage layers support setcap. Thus the default internal ports are
8080 and 8443 for HTTP and HTTPS, the forwarded ports can be anything...

## Install

```
atomic install --name=nginx oszi/nginx:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/nginx:$TAG NAME=nginx
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now ${NAME}
```
