#!/bin/bash -u
pushd ${HOST}/etc/systemd/system/
rm -fv *.wants/limnoria@${NAME}.*

if [ $# -ge 1 ] && [[ $1 =~ (erase|purge) ]]; then
  rm -rfv ${HOST}/${DATA} limnoria@${NAME}.*
fi

if [ $(find *.wants -name 'limnoria@*' | wc -l) -eq 0 ]; then
  rm -fv limnoria@.service
fi
popd
