#!/bin/bash
rsync -av /data/ ${HOST}/var/lib/rtorrent/
chown -R rtorrent: ${HOST}/var/lib/rtorrent/

cp -av /usr/share/install/rtorrent.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/rtorrent.service
