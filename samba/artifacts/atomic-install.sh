#!/bin/bash -eu
rsync -av --ignore-existing /etc/samba/ ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /var/lib/samba/ ${HOST}/${DATADIR}/
/artifacts/atomic-update.sh
