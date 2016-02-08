#!/bin/bash -eu
sudo -u znc znc --foreground --datadir=/data --makeconf
PORT=$(egrep -m1 '\bPort\s*=' /data/configs/znc.conf | egrep -o '[0-9]+')
sed -i -E "s/^PORT=[0-9]+/PORT=${PORT}/g" ${ENVFILE}
