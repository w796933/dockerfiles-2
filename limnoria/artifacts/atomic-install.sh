#!/bin/bash -eu
mkdir -p ${HOST}/${DATADIR}
cd ${HOST}/${DATADIR}

chown -R container: .
chmod -R o=--- .

sudo -u container supybot-wizard --allow-home

if [ ! -f ${NAME}.conf ]; then
  mv *.conf ${NAME}.conf
fi
