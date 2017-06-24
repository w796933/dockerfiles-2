#!/bin/bash -eu
mkdir -p ${HOST}/${DATADIR}
chown -R container: ${HOST}/${DATADIR}
chmod -R o=--- ${HOST}/${DATADIR}
