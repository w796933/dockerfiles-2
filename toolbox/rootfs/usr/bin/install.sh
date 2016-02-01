#!/bin/bash -eu
cp -L /usr/share/install/{toolbox,docker}-aliases.sh ${HOST}/etc/profile.d/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/profile.d/toolbox-aliases.sh
echo "source /etc/profile.d/"{toolbox,docker}"-aliases.sh;"
