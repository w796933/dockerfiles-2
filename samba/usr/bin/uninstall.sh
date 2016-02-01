#!/bin/bash -u
pushd ${HOST}/etc/systemd/system/
rm -fv {*.wants/,}{smb,nmb}.service ${HOST}/usr/local/sbin/smb*

if [ $# -ge 1 ] && [[ $1 =~ (erase|purge) ]]; then
  rm -rfv ${HOST}/${CONF} ${HOST}/${DATA} {smb,nmb}.service.d
fi
popd
