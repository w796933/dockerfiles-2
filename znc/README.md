## docker-znc

Docker image for the [ZNC](http://wiki.znc.in/ZNC) IRC Bouncer.

## Usage

If you mount /data yourself, it must be writable by the container user:

```
docker run --rm --entrypoint sh nightling/znc -c id
```

Interactive first time configuration:

```
docker run -it --rm -v /path/to/znc:/data nightling/znc --makeconf
```

Start ZNC and publish the configured port(s):

```
docker run --rm --name znc -p 6667:6667 -v /path/to/znc:/data nightling/znc
```

## Modules

To install shipped modules symlink the .so files into `/data/modules`.

List available (precompiled) shipped modules:

```
docker run --rm --entrypoint sh nightling/znc -c 'find /usr/share/znc/modules -name *.so'
```

If you want to compile your own modules:

```
docker run --rm -v /path/to/znc:/data -w /data/modules \
--entrypoint znc-buildmod nightling/znc module1.cpp ...
```
