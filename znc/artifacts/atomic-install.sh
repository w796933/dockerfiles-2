#!/bin/bash -eu
mkdir -p ${HOST}/${DATADIR}
cd ${HOST}/${DATADIR}
chown -R container: .
chmod -R o=--- .
sudo -u container znc --foreground --datadir=./ --makeconf
