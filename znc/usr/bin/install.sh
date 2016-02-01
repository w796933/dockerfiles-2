#!/bin/bash -eu
cp -av /usr/share/install/znc@.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/znc@.service

[ $# -ge 1 ] && [[ $1 =~ ^no+p$ ]] && exit 0

chmod 0700 ${HOST}/${DATA}
chown znc: ${HOST}/${DATA}

sudo -u znc znc --foreground --datadir=/data --makeconf

pushd ${HOST}/etc/systemd/system/
mkdir -pv znc@${NAME}.service.d
echo "[Service]
Environment=PORT=$(egrep -m1 '\bPort\s*=' /data/configs/znc.conf | egrep -o '[0-9]+')" \
> znc@${NAME}.service.d/10-env.conf

ln -sv /etc/systemd/system/znc@.service \
multi-user.target.wants/znc@${NAME}.service
popd
