#!/bin/bash
cp -av /usr/share/install/openvpn@.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/openvpn@.service
