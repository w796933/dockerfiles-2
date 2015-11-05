## docker-mpv

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/mpv/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/mpv)

See [mpv.sh](mpv) for an example of running [mpv](http://mpv.io) in a container.

This image is based on Fedora / [base-desktop].

For documentation on how to use this and how it works see [base-desktop].
[base-desktop]:/_desktop/base-desktop

## Notes

Due to the nature of mpv (e.g., hardware acceleration) this image needs to run
in privileged mode. This means it cannot provide any more security than a simple chroot.
You may experience system crashes if you run it on an incompatible host.

Mounted directories (read-only) in which files can be opened:

 * `/media` (but /mnt will not be mounted)

 * `/run/user/${UID}` for the file manager (gvfs cannot be accessed by root)

 * `${HOME}/{Downloads,Library,Music,Public,Videos}`
