##example-drop-in

**/etc/systemd/system/backup@NAME.service.d/prereq.conf**

```
[Service]
ExecStartPre=/opt/backup-databases.sh
```

Dump your databases with `/opt/backup-databases.sh`.

Lock and load:

```
systemctl daemon-reload && systemctl enable --now backup@NAME.timer
```

See also systemd.unit(5) and systemd.service(5).
