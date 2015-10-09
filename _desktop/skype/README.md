## docker-skype

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/skype/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/skype)

See [skype.sh](skype.sh) for a complete example of running Skype in a container.

This image is based on Fedora from [base-desktop](/_desktop/base-desktop).

Host requirements: X11, Pulseaudio.

### Installation

```
docker run --rm -v /usr/local/share:/mnt/share -u root --privileged \
--entrypoint bash quay.io/oszi/skype -c \
"(cd /usr/share && find . -not -wholename '*/lang/*' -name 'skype*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode skype.sh /usr/local/bin/skype
```
