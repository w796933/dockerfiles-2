## docker-electrum

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/keepassx/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/keepassx)

See [keepassx.sh](keepassx) for an example of running [KeePassX](https://www.keepassx.org) in a container.

This image is based on Fedora / [base-desktop].

For documentation on how to use this and how it works see [base-desktop].
[base-desktop]:/_desktop/base-desktop

## Notes

Mounted directories in which files can be opened:

 * `/media` (but /mnt will not be mounted)

 * `/run/user/${UID}` for the file manager (gvfs cannot be accessed by root)

 * `${HOME}/{Documents,Downloads,Works}`
