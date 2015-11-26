#!/bin/bash
mkdir -pv ${HOST}/etc/unbound/conf.d
unbound-control-setup -d ${HOST}/etc/unbound/conf.d

cp -av /usr/share/install/unbound-control ${HOST}/usr/local/sbin/
cp -av /usr/share/install/unbound.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/unbound.service
