## Examples: Tarsnap

Register the machine with tarsnap:

```
shell.sh tarsnap-keygen --keyfile /root/.config/tarsnap.key \
--user root@example.com --machine $(hostname)
```

First time setup for existing backups:

```
shell.sh tarsnap --fsck --keyfile /root/.config/tarsnap.key \
--cachedir /root/.cache/tarsnap
```

**Environment**

```
IMAGE=oszi/backup
NAME=tarsnap
DOCKER_OPTS='-v /:/host:ro -v /root:/root:rw'
CMD=/host/opt/tarsnap-backup.sh
```

**/opt/tarsnap-backup.sh**

```
#!/bin/bash -eu
tarsnap --keyfile /root/.config/tarsnap.key --cachedir /root/.cache/tarsnap \
-c -f $(hostname)-$(date '+%Y%m%d-%H%M') --print-stats \
--exclude '*/.cache/*' --exclude '*/Downloads/*' \
-C /host etc home root opt
```

Use `shell.sh tarsnap` to manage or restore your backups.
