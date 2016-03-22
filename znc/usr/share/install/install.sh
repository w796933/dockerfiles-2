#!/bin/bash -eu
sudo -u container znc --foreground --datadir=/data --makeconf
PORT=$(egrep -m1 '\bPort\s*=' /data/configs/znc.conf | egrep -o '[0-9]+')
sed -i -E "s/^PORT=\S*/PORT=${PORT}/g" ${ENVFILE}
