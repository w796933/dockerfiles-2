#!/bin/bash -eu
cp -av /usr/share/install/tircd@.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/tircd@.service

[ $# -ge 1 ] && [[ $1 =~ ^no+p$ ]] && exit 0

mkdir -pvm 0700 ${HOST}/${DATA}
chown tircd: ${HOST}/${DATA}

ln -sv /etc/systemd/system/tircd@.service \
${HOST}/etc/systemd/system/multi-user.target.wants/tircd@${NAME}.service
