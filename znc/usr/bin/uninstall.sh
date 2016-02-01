#!/bin/bash -u
pushd ${HOST}/etc/systemd/system/
rm -fv *.wants/znc@${NAME}.*

if [ $# -ge 1 ] && [[ $1 =~ (erase|purge) ]]; then
  rm -rfv ${HOST}/${DATA} znc@${NAME}.*
fi

if [ $(find *.wants -name 'znc@*' | wc -l) -eq 0 ]; then
  rm -fv znc@.service
fi
popd
