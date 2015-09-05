## docker-chrome

See [google-chrome.sh](https://github.com/Nightling/dockerfiles/blob/master/_desktop/chrome/google-chrome.sh)
for a complete example of running Chrome in a container.

This image is based on Fedora from
[nightling/base-gui](https://github.com/Nightling/dockerfiles/blob/master/_desktop/base-gui).

Host requirements: X11, Pulseaudio.

### Installation

```
docker run --rm -v /usr/local/share:/mnt/share -u root --entrypoint bash nightling/chrome -c \
"(cd /usr/share && find . -name 'google-chrome*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode google-chrome.sh /usr/local/bin/google-chrome
```
