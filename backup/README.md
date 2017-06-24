## docker-backup

Docker image for backup tools:

* [borg](https://borgbackup.readthedocs.io), [borgmatic](https://github.com/witten/borgmatic)
* [duplicity](http://duplicity.nongnu.org), [duply](http://duply.net)
* [rsnapshot](http://rsnapshot.org)
* [tarsnap](https://www.tarsnap.com)
* [zbackup](http://zbackup.org)

Also includes useful packages from [buildpack](/buildpack).

## Notes

Check out some [examples](examples)...

[Script](artifacts/shell.sh) for running interactive containers:

```
shell.sh [:tag] [run-opts] [command]
```

For fuse mounts (e.g. with borg) the `--privileged` option is required.

Please note that spaces in run options are not handled properly.

Default mount points:

| Host          | Container     | Mode |
|---------------|---------------|------|
| /             | /host         | ro   |
| /home         | /home         | rw   |
| /media        | /media        | rw   |
| /mnt          | /mnt          | rw   |
| /run          | /run          | rw   |
| /root/.cache  | /root/.cache  | rw   |
| /root/.config | /root/.config | rw   |
| /root/.local  | /root/.local  | rw   |
| /root/.gnupg  | /root/.gnupg  | rw   |
| /root/.ssh    | /root/.ssh    | rw   |
| /var/tmp      | /var/tmp      | rw   |
| /tmp          | /tmp          | rw   |
