#!/bin/bash -eu
mkdir -p ${HOST}/${CONFDIR} ${HOST}/${DATADIR}
chown -R container: ${HOST}/${CONFDIR} ${HOST}/${DATADIR}
chmod -R o=--- ${HOST}/${CONFDIR} ${HOST}/${DATADIR}

export EASYRSA_PKI=${HOST}/${CONFDIR}/pki
cd ${HOST}/${CONFDIR}

if [ ! -d ${EASYRSA_PKI} ]; then
  easyrsa init-pki
# easyrsa build-ca && easyrsa gen-crl && easyrsa gen-dh
# easyrsa build-server-full $(hostname)
  openvpn --genkey --secret ${EASYRSA_PKI}/ta.key
  cp -v ${EASYRSA}/vars.example ${EASYRSA_PKI}/vars
  touch -a ${NAME}.conf
fi

/artifacts/atomic-update.sh
