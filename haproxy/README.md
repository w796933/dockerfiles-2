## docker-haproxy

[HAProxy](https://haproxy.com) high availability load balancer and proxy server.

## Notes

Environment file: `/etc/sysconfig/containers/haproxy/NAME`

Configuration directory: `/etc/haproxy/NAME` mounted as `/etc/haproxy`

The container runs with a non-privileged user so haproxy cannot bind to ports below 1024.

You can configure port forwarding in the environment file.

## Install

```
atomic install -n default oszi/haproxy
```

Manually on any distribution:

```
export IMAGE=oszi/haproxy NAME=default
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```
