## docker-in-docker

[![Docker Repository on Quay.io](https://quay.io/repository/nightling/docker/status "Docker Repository on Quay.io")](https://quay.io/repository/nightling/docker)

Docker-in-Docker on Fedora, based on [jpetazzo / dind](https://github.com/jpetazzo/dind).

Run Docker-in-Docker and spawn a shell:

```
docker run -it --privileged quay.io/nightling/docker
```

Run Docker-in-Docker and expose the containerized daemon:

```
docker run -d -p 2375 -e PORT=2375 --privileged quay.io/nightling/docker
```

Useful environment variables to configure the [docker daemon] with additional options:

 * `OPTIONS` for general purpose parameters

 * `STORAGE_OPTIONS` for storage related parameters (the default driver is overlay!)

 * `NETWORK_OPTIONS` for network related parameters

 * `PORT` for setting the listening port

 * and the [built-in] variables.

[docker daemon]:https://docs.docker.com/reference/commandline/daemon/
[built-in]:https://docs.docker.com/reference/commandline/cli/#environment-variables
