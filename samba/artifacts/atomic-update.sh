#!/bin/bash -eu
sed -E "s|^(NAME=).*|\1${NAME}|" /artifacts/shell.sh > ${HOST}/${CONFDIR}/shell.sh
chmod +x ${HOST}/${CONFDIR}/shell.sh
