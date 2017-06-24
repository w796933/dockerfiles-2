#!/bin/bash -eu
mkdir -p ${HOST}/${CONFDIR}
sed -E "s|^(IMAGE=).*|\1${IMAGE}|;s|^(NAME=).*|\1${NAME}|" /artifacts/shell.sh \
> ${HOST}/${CONFDIR}/shell.sh
chmod +x ${HOST}/${CONFDIR}/shell.sh
