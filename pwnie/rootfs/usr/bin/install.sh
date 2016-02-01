#!/bin/bash -eu
cp -av /usr/share/install/pwnie ${HOST}/usr/local/bin/
sed -i "s;__IMAGE__;${IMAGE};g" ${HOST}/usr/local/bin/pwnie
