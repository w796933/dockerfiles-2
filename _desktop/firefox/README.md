## docker-firefox

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/firefox/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/firefox)

See [firefox.sh](firefox.sh) for a complete example of running Firefox in a container.

This image is based on Fedora from [base-desktop](/_desktop/base-desktop).

Host requirements: X11, Pulseaudio.

### Installation

```
docker run --rm -v /usr/local/share:/mnt/share -u root --privileged \
--entrypoint bash quay.io/oszi/firefox -c \
"(cd /usr/share && find . -name 'firefox*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode firefox.sh /usr/local/bin/firefox
```
