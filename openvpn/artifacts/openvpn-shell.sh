#!/bin/bash -eu
if [ $# -eq 0 ]; then
  echo "Usage: openvpn-shell <name> [command]" >&2
  exit 1
fi

ENVFILE=/etc/sysconfig/containers/openvpn/$1
. ${ENVFILE}

exec docker run -t -i --rm --env-file=${ENVFILE} --name=${NAME}-shell \
-v "$CONFDIR":/etc/openvpn:rw -v "$DATADIR":/var/lib/openvpn:rw \
--net=host --cap-add=NET_ADMIN --security-opt=label=disable \
--entrypoint="${2:-bash}" ${IMAGE} "${@:3:$#}"
