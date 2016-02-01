#!/bin/bash -eu
cp -av /usr/share/install/miniircd@.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/miniircd@.service

[ $# -ge 1 ] && [[ $1 =~ ^no+p$ ]] && exit 0

mkdir -pvm 0700 ${HOST}/${DATA}
chown miniircd: ${HOST}/${DATA}

ln -sv /etc/systemd/system/miniircd@.service \
${HOST}/etc/systemd/system/multi-user.target.wants/miniircd@${NAME}.service
