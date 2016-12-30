## docker-haproxy

[HAProxy](https://haproxy.com) high availability load balancer and proxy server.

## Notes

Environment file: `/etc/sysconfig/containers/NAME`

Configuration directory: `/etc/containers/NAME` mounted as `/etc/haproxy`.

Data directory: `/var/containers/NAME` mounted as `/var/lib/haproxy`.

The container runs with a non-privileged user so haproxy cannot bind to ports below 1024.

You can configure port forwarding in the environment file.

## Install

```
atomic install --name=haproxy oszi/haproxy:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/haproxy:$TAG NAME=haproxy
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now ${NAME}
```
