## docker-electrum

See [electrum.sh](https://github.com/Nightling/dockerfiles/blob/master/_desktop/electrum/electrum.sh)
for a complete example of running Electrum in a container.

This image is based on Fedora from
[nightling/base-gui](https://github.com/Nightling/dockerfiles/blob/master/_desktop/base-gui).

Host requirements: X11.

### Installation

```
docker run --rm -v /usr/share:/mnt/share -u root --entrypoint bash nightling/electrum -c \
"(cd /usr/share && find . -name 'electrum*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode electrum.sh /usr/bin/electrum
```
