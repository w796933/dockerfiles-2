#!/bin/bash -eu
sed -E "s|^(IMAGE=).*|\1${IMAGE}|" /artifacts/shell.sh > ${HOST}/${CONFDIR}/shell.sh
chmod +x ${HOST}/${CONFDIR}/shell.sh
