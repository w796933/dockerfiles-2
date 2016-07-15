#!/bin/bash -eu
mv -v ${ENVFILE} $(dirname ${ENVFILE})/${INAME} 2> /dev/null || :
# There can be only one!

rsync -av --ignore-existing /etc/samba/ ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /var/lib/samba/ ${HOST}/${DATADIR}/
