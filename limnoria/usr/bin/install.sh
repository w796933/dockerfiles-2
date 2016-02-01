#!/bin/bash -eu
cp -av /usr/share/install/limnoria@.service ${HOST}/etc/systemd/system/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/etc/systemd/system/limnoria@.service

[ $# -ge 1 ] && [[ $1 =~ ^no+p$ ]] && exit 0

chmod 0700 ${HOST}/${DATA}
chown limnoria: ${HOST}/${DATA}

sudo -u limnoria supybot-wizard --allow-home
test ! -f ${NAME}.conf && mv *.conf ${NAME}.conf

ln -sv /etc/systemd/system/limnoria@.service \
${HOST}/etc/systemd/system/multi-user.target.wants/limnoria@${NAME}.service
