#!/bin/bash -u
pushd ${HOST}/etc/systemd/system/
rm -fv {*.wants/,}{unbound,dns}.service ${HOST}/usr/local/sbin/unbound-control

if [ $# -ge 1 ] && [[ $1 =~ (erase|purge) ]]; then
  rm -rfv ${HOST}/${CONF} ${HOST}/${DATA} {unbound,dns}.service.d
fi
popd
