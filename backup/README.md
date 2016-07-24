## docker-backup

Docker image for backup tools:

 * [borg](https://borgbackup.readthedocs.io), [borgmatic](https://github.com/witten/borgmatic)

 * [duplicity](http://duplicity.nongnu.org), [duply](http://duply.net)

 * [rsnapshot](http://rsnapshot.org)

 * [tarsnap](https://www.tarsnap.com)

 * [zbackup](http://zbackup.org)

Also includes useful packages from [buildpack](/buildpack).

## Notes

Environment file: `/etc/sysconfig/containers/backup/NAME`

Default mount points:

| Host   | Container | Mode |
|--------|-----------|------|
| /      | /host     | ro   |
| /media | /media    | rw   |
| /mnt   | /mnt      | rw   |
| /root  | /root     | rw   |

[Script](artifacts/sbin/backup-container) for running interactive containers:

```
backup-container [:tag] [run-opts] [command]
```

For fuse mounts (e.g. with borg) the `--privileged` option is required.

Please note that spaces in run options are not handled properly.

---

Systemd [timer](artifacts/backup@.timer) for scheduled backups:

First, set the CMD in the environment file then you can enable the timer:

```
systemctl enable --now backup@${NAME}.timer
```

The timer runs once a day by default. You can either override it with drop-ins
or create your own timers and use the `Unit=backup@NAME.service` directive.
Drop-ins can also be used for the service to dump a database, etc.

## Install

```
atomic install -n something oszi/backup
```

Manually on any distribution:

```
export IMAGE=oszi/backup NAME=something
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

Check out some [examples](examples)...
