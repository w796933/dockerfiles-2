## docker-znc

Docker image for the [ZNC](http://wiki.znc.in/ZNC) IRC Bouncer.

## Usage

If you mount /data yourself, it must be writable by the container user:

```
docker run --rm --entrypoint sh oszi/znc:$TAG -c id
```

Interactive first time configuration:

```
docker run -it --rm -v /path/to/znc:/data:Z oszi/znc:$TAG --makeconf
```

Start ZNC and publish the configured port(s):

```
docker run --rm --name=znc -p 7000:7000 -v /path/to/znc:/data:Z oszi/znc:$TAG
```

## Modules

This image contains external [modules](usr/src)...

Additional modules can be installed under `/data/modules`.

## Install

```
atomic install --name=znc oszi/znc:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/znc:$TAG NAME=znc
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now ${NAME}
```
