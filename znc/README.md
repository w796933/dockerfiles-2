## docker-znc

Docker image for the [ZNC](http://wiki.znc.in/ZNC) IRC Bouncer.

## Usage

If you mount /data yourself, it must be writable by the container user:

```
docker run --rm --entrypoint sh oszi/znc -c id
```

Interactive first time configuration:

```
docker run -it --rm -v /path/to/znc:/data:Z oszi/znc --makeconf
```

Start ZNC and publish the configured port(s):

```
docker run --rm --name znc -p 7000:7000 -v /path/to/znc:/data:Z oszi/znc
```

## Modules

To install shipped modules symlink the .so files into `/data/modules`.

List available (precompiled) shipped modules:

```
docker run --rm --entrypoint sh oszi/znc -c \
'find /usr/share/znc/modules-external -name *.so'
```
