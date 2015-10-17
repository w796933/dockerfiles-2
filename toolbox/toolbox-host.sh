#!/bin/bash
"$(dirname "$(realpath "$0")")"/toolbox.sh \
--{net,ipc,pid,uts}=host \
-v /:/host:rw \
-v /boot:/boot:ro \
-v /etc/environment:/etc/environment:ro \
-v /etc/group:/etc/group:ro \
-v /etc/machine-id:/etc/machine-id:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/shadow:/etc/shadow:ro \
-v /etc/systemd:/etc/systemd:rw \
-v /home:/home:rw \
-v /media:/media:rw \
-v /mnt:/mnt:rw \
-v /run:/run:rw \
-v /sys/fs/cgroup:/sys/fs/cgroup:rw \
-v /var/log/journal:/var/log/journal:rw \
$(for e in $(env | cut -d'=' -f1 | grep DOCKER); do echo "-e $e"; done) \
-w /host "$@"
