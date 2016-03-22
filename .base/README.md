## docker-fedora

Fedora base image created with DNF.

## Notes

 * The list of installed packages is configured in the [vars](vars) file.

 * Any missing RPM signing key will be installed on the host.

 * My personal root CA is imported in the image.

 * The `en_US.UTF-8` locale is the default and only locale.

 * There is a `container` user and group: `HOME=/data` `UID=65000`

 * `nogroup` is an alias for `nobody` for compatibility.

 * Current RPMFusion installers can be found in `/usr/share/rpmfusion`.
