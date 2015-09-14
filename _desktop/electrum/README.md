## docker-electrum

[![Docker Repository on Quay.io](https://quay.io/repository/nightling/electrum/status "Docker Repository on Quay.io")](https://quay.io/repository/nightling/electrum)

See [electrum.sh](electrum.sh) for a complete example of running Electrum in a container.

This image is based on Fedora from [base-desktop](/_desktop/base-desktop).

Host requirements: X11.

### Installation

```
docker run --rm -v /usr/local/share:/mnt/share -u root --privileged \
--entrypoint bash quay.io/nightling/electrum -c \
"(cd /usr/share && find . -name 'electrum*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode electrum.sh /usr/local/bin/electrum
```
