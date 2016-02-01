#!/bin/bash -eu
cp -av /usr/share/install/rtorrent@.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/rtorrent@.service

[ $# -ge 1 ] && [[ $1 =~ ^no+p$ ]] && exit 0

rsync -av --ignore-existing /data/ ${HOST}/${DATA}/

ln -sv /etc/systemd/system/rtorrent@.service \
${HOST}/etc/systemd/system/multi-user.target.wants/rtorrent@${NAME}.service
