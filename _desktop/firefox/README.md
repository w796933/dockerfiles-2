## docker-firefox

See [firefox.sh](https://github.com/Nightling/dockerfiles/blob/master/_desktop/firefox/firefox.sh)
for a complete example of running Firefox in a container.

This image is based on Fedora from
[nightling/base-gui](https://github.com/Nightling/dockerfiles/blob/master/_desktop/base-gui).

Host requirements: X11, Pulseaudio.

### Installation

```
docker run --rm -v /usr/share:/mnt/share -u root --entrypoint bash nightling/firefox -c \
"(cd /usr/share && find . -name 'firefox*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode firefox.sh /usr/bin/firefox
```
