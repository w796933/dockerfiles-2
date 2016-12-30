## docker-backup

Docker image for backup tools:

 * [borg](https://borgbackup.readthedocs.io), [borgmatic](https://github.com/witten/borgmatic)

 * [duplicity](http://duplicity.nongnu.org), [duply](http://duply.net)

 * [rsnapshot](http://rsnapshot.org)

 * [tarsnap](https://www.tarsnap.com)

 * [zbackup](http://zbackup.org)

Also includes useful packages from [buildpack](/buildpack).

## Notes

Environment file: `/etc/sysconfig/containers/NAME`

[Script](artifacts/backup-shell.sh) for running interactive containers:

```
backup-shell [:tag] [run-opts] [command]
```

For fuse mounts (e.g. with borg) the `--privileged` option is required.

Please note that spaces in run options are not handled properly.

Default mount points:

| Host          | Container     | Mode |
|---------------|---------------|------|
| /             | /host         | ro   |
| /home         | /home         | ro   |
| /media        | /media        | rw   |
| /mnt          | /mnt          | rw   |
| /run          | /run          | rw   |
| /root/.cache  | /root/.cache  | rw   |
| /root/.config | /root/.config | rw   |
| /root/.gnupg  | /root/.gnupg  | rw   |
| /root/.ssh    | /root/.ssh    | rw   |
| /var/tmp      | /var/tmp      | rw   |
| /tmp          | /tmp          | rw   |

---

Systemd [timer](artifacts/timer) for scheduled backups:

First, set the CMD in the environment file then you can enable the timer:

```
systemctl enable --now ${NAME}.timer
```

The timer runs once a day by default. You can either override it with drop-ins
or create your own timers and use the `Unit=NAME.service` directive.
Drop-ins can also be used for the service to list packages, etc.

## Install

```
atomic install --name=backup oszi/backup:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/backup:$TAG NAME=backup
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

Check out some [examples](examples)...
