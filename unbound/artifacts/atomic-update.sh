#!/bin/bash -eu
sed -E "s|^(NAME=).*|\1${NAME}|" /artifacts/unbound-control.sh > ${HOST}/${CONFDIR}/unbound-control.sh
chmod +x ${HOST}/${CONFDIR}/unbound-control.sh
