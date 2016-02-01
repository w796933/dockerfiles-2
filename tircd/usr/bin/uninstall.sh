#!/bin/bash -u
pushd ${HOST}/etc/systemd/system/
rm -fv *.wants/tircd@${NAME}.*

if [ $# -ge 1 ] && [[ $1 =~ (erase|purge) ]]; then
  rm -rfv ${HOST}/${DATA} tircd@${NAME}.*
fi

if [ $(find *.wants -name 'tircd@*' | wc -l) -eq 0 ]; then
  rm -fv tircd@.service
fi
popd
