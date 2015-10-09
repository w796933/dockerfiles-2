## docker-hexchat

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/hexchat/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/hexchat)

See [hexchat.sh](hexchat.sh) for a complete example of running HexChat in a container.

This image is based on Fedora from [base-desktop](/_desktop/base-desktop).

Host requirements: X11.

### Installation

```
docker run --rm -v /usr/local/share:/mnt/share -u root --privileged \
--entrypoint bash quay.io/oszi/hexchat -c \
"(cd /usr/share && find . -name 'hexchat*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode hexchat.sh /usr/local/bin/hexchat
```
