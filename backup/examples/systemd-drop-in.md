##example-drop-in

**/etc/systemd/system/NAME.service.d/prereq.conf**

```
[Service]
ExecStartPre=-/bin/sh -c '/usr/bin/yum list installed > /etc/yum-installed.save'
ExecStartPre=-/bin/sh -c '/usr/bin/docker images > /etc/docker-images.save'
```

Lock and load:

```
systemctl daemon-reload
```

See also systemd.unit, systemd.service, systemd.timer man pages.
