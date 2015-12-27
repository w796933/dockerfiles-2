#!/bin/bash
rsync -av /data/ ${HOST}/mnt/torrent/
chown -R rtorrent: ${HOST}/mnt/torrent/

cp -av /usr/share/install/rtorrent.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/rtorrent.service
