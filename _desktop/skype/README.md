## docker-skype

See [skype.sh](https://github.com/Nightling/dockerfiles/blob/master/_desktop/skype/skype.sh) 
for a complete example of running Skype in a container.

This image is based on Fedora from
[nightling/base-gui](https://github.com/Nightling/dockerfiles/blob/master/_desktop/base-gui).

Host requirements: X11, Pulseaudio.

### Installation

```
docker run --rm -v /usr/share:/mnt/share -u root --entrypoint bash nightling/skype -c \
"(cd /usr/share && find . -not -wholename '*/lang/*' -name 'skype*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode skype.sh /usr/bin/skype
```
