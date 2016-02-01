#!/bin/bash -eu
pushd /usr/share/install/
find -type f -executable -exec cp -av {} ${HOST}/usr/local/sbin/ \;
cp -av {smb,nmb}.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/{smb,nmb}.service
popd

[ $# -ge 1 ] && [[ $1 =~ ^no+p$ ]] && exit 0

rsync -av --ignore-existing /etc/samba/ ${HOST}/${CONF}/
rsync -av --ignore-existing /var/lib/samba/ ${HOST}/${DATA}/

ln -sv /etc/systemd/system/{smb,nmb}.service \
${HOST}/etc/systemd/system/multi-user.target.wants/
