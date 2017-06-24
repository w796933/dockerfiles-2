#!/bin/bash -eu
mkdir -p ${HOST}/${CONFDIR} ${HOST}/${DATADIR}
chown -R container: ${HOST}/${CONFDIR} ${HOST}/${DATADIR}
chmod -R o=--- ${HOST}/${CONFDIR} ${HOST}/${DATADIR}

unbound-control-setup -d ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /etc/unbound/ ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /var/lib/unbound/ ${HOST}/${DATADIR}/
/artifacts/atomic-update.sh
