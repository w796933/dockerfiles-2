#!/bin/bash -eu
mkdir -p ${HOST}/${CONFDIR}
cp -av /artifacts/toolbox*.sh ${HOST}/${CONFDIR}/
sed -i -E "s|^(IMAGE=).*|\1${IMAGE}|" ${HOST}/${CONFDIR}/toolbox*.sh
