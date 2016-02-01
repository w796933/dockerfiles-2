#!/bin/bash -eu
cp -av /usr/share/install/unbound-control ${HOST}/usr/local/sbin/

pushd ${HOST}/etc/systemd/system/
cp -av /usr/share/install/unbound.service .
sed -i "s;__IMAGE__;${IMAGE};g" unbound.service
ln -sfv {unbound,dns}.service
popd

[ $# -ge 1 ] && [[ $1 =~ ^no+p$ ]] && exit 0

unbound-control-setup -d ${HOST}/${CONF}
rsync -av --ignore-existing /etc/unbound/ ${HOST}/${CONF}/
rsync -av --ignore-existing /var/lib/unbound/ ${HOST}/${DATA}/

ln -sv /etc/systemd/system/unbound.service \
${HOST}/etc/systemd/system/multi-user.target.wants/
