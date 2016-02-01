#!/bin/bash -u
pushd ${HOST}/etc/systemd/system/
rm -fv *.wants/rtorrent@${NAME}.*

if [ $# -ge 1 ] && [[ $1 =~ (erase|purge) ]]; then
  rm -rfv ${HOST}/${DATA} rtorrent@${NAME}.*
fi

if [ $(find *.wants -name 'rtorrent@*' | wc -l) -eq 0 ]; then
  rm -fv rtorrent@.service
fi
popd
