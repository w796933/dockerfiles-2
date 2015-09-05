## docker-libreoffice

See [libreoffice.sh](https://github.com/Nightling/dockerfiles/blob/master/_desktop/libreoffice/libreoffice.sh)
for a complete example of running LibreOffice in a container.

This image is based on Fedora from
[nightling/base-gui](https://github.com/Nightling/dockerfiles/blob/master/_desktop/base-gui).

Host requirements: X11.

### Installation

```
docker run --rm -v /usr/local/share:/mnt/share -u root --entrypoint bash nightling/libreoffice -c \
"(cd /usr/share && find . -name 'libreoffice*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode libreoffice.sh /usr/local/bin/libreoffice
```

### Usage

Any existing directory given as a parameter will be mounted in /mnt/ -
including files' parent directories. Because of the isolation some things
will not work, for instance, opening links in a browser.
