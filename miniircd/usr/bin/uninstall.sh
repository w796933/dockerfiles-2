#!/bin/bash -u
pushd ${HOST}/etc/systemd/system/
rm -fv *.wants/miniircd@${NAME}.*

if [ $# -ge 1 ] && [[ $1 =~ (erase|purge) ]]; then
  rm -rfv ${HOST}/${DATA} miniircd@${NAME}.*
fi

if [ $(find *.wants -name 'miniircd@*' | wc -l) -eq 0 ]; then
  rm -fv miniircd@.service
fi
popd
