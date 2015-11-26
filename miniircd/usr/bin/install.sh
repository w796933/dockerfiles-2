#!/bin/bash
mkdir -pv ${HOST}/var/lib/miniircd
chown miniircd: ${HOST}/var/lib/miniircd

cp -av /usr/share/install/miniircd.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/miniircd.service
