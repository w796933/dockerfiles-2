#!/bin/bash
cp -av /usr/share/install/supybot-setup ${HOST}/usr/local/sbin/
cp -av /usr/share/install/supybot*.service* ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/usr/local/sbin/supybot-setup \
${HOST}/etc/systemd/system/supybot*.service
