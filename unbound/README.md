## docker-unbound

Docker image for an out of the box, secure DNS resolver.

[Unbound](https://unbound.net) is a validating, recursive, and caching DNS resolver.

## Usage

Warning: Recursive queries are allowed by default!

Start unbound with the default configuration:

```
docker run -d --name=unbound -p 53:53/udp -p 53:53/tcp oszi/unbound:$TAG
```

Accessing unbound-control in a running container:

```
docker exec -it unbound unbound-control --help
```

## Install

```
atomic install oszi/unbound:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/unbound:$TAG NAME=unbound
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now unbound
```
