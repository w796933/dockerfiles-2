## docker-unbound

Docker image for an out of the box, secure DNS resolver.

[Unbound](https://unbound.net) is a validating, recursive, and caching DNS resolver.

## Usage

Warning: Recursive queries are allowed by default in conf.d/access.conf!

Start unbound with the default configuration:

```
docker run -d --name=unbound -p 53:53/udp -p 53:53/tcp oszi/unbound
```

Accessing unbound-control in a running container:

```
docker exec -it unbound unbound-control --help
```
