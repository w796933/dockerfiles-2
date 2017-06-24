## docker-znc

Docker image for the [ZNC](http://wiki.znc.in/ZNC) IRC Bouncer.

## Usage

Interactive first time configuration:

```
mkdir -p -m 0750 /var/lib/znc && chown 65000:65000 /var/lib/znc
docker run -it --rm -v /var/lib/znc:/data:Z oszi/znc --makeconf
```

Start ZNC and publish the configured port(s):

```
docker run -d --name=znc -p 7000:7000 -v /var/lib/znc:/data:Z oszi/znc
```

## Modules

This image contains external [modules](usr/src)...

Additional modules can be installed under `/data/modules`.
