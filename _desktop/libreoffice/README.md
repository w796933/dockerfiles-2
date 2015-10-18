## docker-libreoffice

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/libreoffice/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/libreoffice)

See [libreoffice.sh](libreoffice) for an example of running LibreOffice in a container.

This image is based on Fedora / [base-desktop].

For documentation on how to use this and how it works see [base-desktop].
[base-desktop]:/_desktop/base-desktop

### Usage

Any existing directory given as a parameter will be mounted in /mnt/ -
including files' parent directories. Because of the isolation some things
will not work, for instance, opening links in a browser.
