## docker-hexchat

See [hexchat.sh](https://github.com/Nightling/dockerfiles/blob/master/_desktop/hexchat/hexchat.sh)
for a complete example of running HexChat in a container.

This image is based on Fedora from
[nightling/base-gui](https://github.com/Nightling/dockerfiles/blob/master/_desktop/base-gui).

Host requirements: X11.

### Installation

```
docker run --rm -v /usr/local/share:/mnt/share -u root --entrypoint bash nightling/hexchat -c \
"(cd /usr/share && find . -name 'hexchat*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode hexchat.sh /usr/local/bin/hexchat
```
