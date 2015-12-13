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

This image contains some external [modules](usr/src/znc/modules)...

Additional modules can be installed under `/data/modules`.
