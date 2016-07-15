#!/bin/bash -eu
pushd /data > /dev/null
sudo -u container supybot-wizard --allow-home
test ! -f ${NAME}.conf && mv *.conf ${NAME}.conf
popd > /dev/null
