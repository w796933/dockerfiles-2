#!/bin/bash -u
pushd ${HOST}/etc/systemd/system/
rm -fv *.wants/openvpn@${NAME}.*

if [ $# -ge 1 ] && [[ $1 =~ (erase|purge) ]]; then
  rm -rfv ${HOST}/${CONF} ${HOST}/${DATA} openvpn@${NAME}.*
fi

if [ $(find *.wants -name 'openvpn@*' | wc -l) -eq 0 ]; then
  rm -fv openvpn@.service
fi
popd
