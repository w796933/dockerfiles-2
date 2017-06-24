#!/bin/bash -eu
mkdir -p ${HOST}/${CONFDIR} ${HOST}/${DATADIR}
chown -R container: ${HOST}/${CONFDIR} ${HOST}/${DATADIR}
chmod -R o=--- ${HOST}/${CONFDIR} ${HOST}/${DATADIR}

export EASYRSA_PKI=${HOST}/${CONFDIR}/pki
cd ${HOST}/${CONFDIR}

if [ ! -d ${EASYRSA_PKI} ]; then
  easyrsa init-pki
  cp -v ${EASYRSA}/vars.example ${EASYRSA_PKI}/vars
  touch -a ${NAME}.conf
fi

/artifacts/atomic-update.sh

echo 'Dropping into an interactive shell...'
bash -i || :
