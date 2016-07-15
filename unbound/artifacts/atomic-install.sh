#!/bin/bash -eu
mv -v ${ENVFILE} $(dirname ${ENVFILE})/${INAME} 2> /dev/null || :
# There can be only one!

unbound-control-setup -d ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /etc/unbound/ ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /var/lib/unbound/ ${HOST}/${DATADIR}/
