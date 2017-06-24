## Examples: Systemd

**/etc/systemd/system/NAME.timer**

```
[Unit]
Description=Backup Service Timer
After=default.target network-online.target
Wants=network-online.target

[Timer]
OnCalendar=daily
RandomizedDelaySec=3600
Persistent=true

[Install]
WantedBy=timers.target
```

**/etc/systemd/system/NAME.service**

```
[Unit]
Description=Backup Service

[Service]
EnvironmentFile=/etc/environment
Environment=IMAGE=oszi/backup
Environment=DOCKER_OPTS="-v /:/host:ro -v /root:/root:rw"
Environment=CMD=/host/opt/backup.sh
Restart=on-abnormal
RestartSec=600

ExecStartPre=-/usr/bin/docker rm -v %p
ExecStart=/usr/bin/docker run --rm --name=%p \
--network=host --security-opt=label=disable \
-v /etc/machine-id:/etc/machine-id:ro -v /etc/group:/etc/group:ro \
-v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro \
$DOCKER_OPTS ${IMAGE} $CMD
```

Lock and load:

```
systemctl daemon-reload
systemctl enable --now NAME.timer
```
