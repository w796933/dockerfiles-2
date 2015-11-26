#!/bin/bash
mkdir -pv ${HOST}/var/lib/tircd
chown tircd: ${HOST}/var/lib/tircd

cp -av /usr/share/install/tircd.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/tircd.service
