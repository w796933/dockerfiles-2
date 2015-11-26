#!/bin/bash
cp -av /usr/share/install/znc-setup ${HOST}/usr/local/sbin/
cp -av /usr/share/install/znc@.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/usr/local/sbin/znc-setup \
${HOST}/etc/systemd/system/znc@.service
