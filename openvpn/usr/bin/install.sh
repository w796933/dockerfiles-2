#!/bin/bash -eu
cp -av /usr/share/install/openvpn@.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/openvpn@.service

[ $# -ge 1 ] && [[ $1 =~ ^no+p$ ]] && exit 0

test ! -d ${EASYRSA_PKI} && easyrsa init-pki
cp -nv ${EASYRSA}/vars.example ${EASYRSA_PKI}/vars
touch -a ${NAME}.conf

echo "Dropping into an interactive shell..."
bash -i || :

ln -sv /etc/systemd/system/openvpn@.service \
${HOST}/etc/systemd/system/multi-user.target.wants/openvpn@${NAME}.service
