#!/bin/bash
rsync -av /etc/samba/ ${HOST}/etc/samba/
rsync -av /var/lib/samba/ ${HOST}/var/lib/samba/

pushd /usr/share/install/
find -type f -executable -exec cp -av {} ${HOST}/usr/local/sbin/ \;
cp -av {smb,nmb}.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/{smb,nmb}.service
popd &> /dev/null
