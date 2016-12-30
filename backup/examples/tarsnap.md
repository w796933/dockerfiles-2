##example-tarsnap

Register the machine with tarsnap:

```
backup-shell tarsnap-keygen --keyfile /root/.config/tarsnap.key \
--user root@example.com --machine $(hostname -s)
```

First time setup for existing backups:

```
backup-shell tarsnap --fsck --keyfile /root/.config/tarsnap.key \
--cachedir /root/.cache/tarsnap
```

**/etc/sysconfig/containers/tarsnap**

```
IMAGE=oszi/backup:$TAG
NAME=tarsnap
DOCKER_OPTS='-v /:/host:ro -v /root:/root:rw'
CMD=/host/opt/tarsnap-backup.sh
```

**/opt/tarsnap-backup.sh**

```
#!/bin/bash -eu
tarsnap --keyfile /root/.config/tarsnap.key --cachedir /root/.cache/tarsnap \
-c -f $(hostname -s)-$(date '+%Y%m%d-%H%M') --print-stats \
--exclude '*/.cache/*' --exclude '*/Downloads/*' \
-C /host etc home root opt
```

Use `backup-shell tarsnap` to manage or restore your backups.
