## docker-clementine

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/clementine/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/clementine)

See [clementine.sh](clementine) for an example of running [Clementine](https://www.clementine-player.org) in a container.

This image is based on Fedora / [base-desktop].

For documentation on how to use this and how it works see [base-desktop].
[base-desktop]:/_desktop/base-desktop

## Notes

Mounted directories (read-only) in which files can be opened:

 * `/media` (but /mnt will not be mounted)

 * `/run/user/${UID}` for the file manager (gvfs cannot be accessed by root)

 * `${HOME}/{Downloads,Library,Music,Public,Videos}` under /data
