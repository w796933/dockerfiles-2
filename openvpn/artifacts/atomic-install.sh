#!/bin/bash -eu
pushd /etc/openvpn > /dev/null
test ! -d ${EASYRSA_PKI} && easyrsa init-pki
cp -nv ${EASYRSA}/vars.example ${EASYRSA_PKI}/vars
touch -a ${NAME}.conf
echo 'Dropping into an interactive shell...'
bash -i || :
popd > /dev/null
