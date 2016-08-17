## docker-fedora

Fedora base image created with DNF.

## Notes

 * The list of installed packages is configured in the [config.mk](config.mk) file.

 * My personal root CA is imported in the image.

 * The `en_US.UTF-8` locale is the default and only locale.

 * There is a `container` user and group: `HOME=/data` `UID=65000`

 * `nogroup` is an alias for `nobody` for compatibility.

### Containerized systemd

```
docker run -t -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /run --tmpfs=/tmp ${IMAGE} init
```
