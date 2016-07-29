##example-tarsnap

Register the machine with tarsnap:

```
backup-container tarsnap-keygen --keyfile /root/tarsnap.key \
--user root@example.com --machine $(hostname -s)
```

First time setup for existing backups:

```
backup-container tarsnap --fsck --keyfile /root/tarsnap.key \
--cachedir /root/.cache/tarsnap
```

**/etc/sysconfig/containers/backup/tarsnap**

```
IMAGE=oszi/backup
NAME=backup-tarsnap
DOCKER_OPTS='-v /:/host:ro -v /root:/root:rw'
CMD=/host/opt/tarsnap-backup.sh
```

**/opt/tarsnap-backup.sh**

```
#!/bin/bash -eu
tarsnap --keyfile /root/tarsnap.key --cachedir /root/.cache/tarsnap \
-c -f $(hostname -s)-$(date '+%Y%m%d-%H%M') --print-stats \
--exclude '*/.cache/*' --exclude '*/Downloads/*' \
-C /host etc home root opt
```

Use `backup-container tarsnap` to manage or restore your backups.
