## docker-chrome

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/chrome/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/chrome)

See [google-chrome.sh](google-chrome.sh) for a complete example of running Chrome in a container.

This image is based on Fedora from [base-desktop](/_desktop/base-desktop).

Host requirements: X11, Pulseaudio.

### Installation

```
docker run --rm -v /usr/local/share:/mnt/share -u root --privileged \
--entrypoint bash quay.io/oszi/chrome -c \
"(cd /usr/share && find . -name 'google-chrome*' > /tmp/files) \
&& rsync -av --files-from=/tmp/files /{usr,mnt}/share/"
```
```
cp --preserve=mode google-chrome.sh /usr/local/bin/google-chrome
```
