#!/bin/bash -eu
IMAGE=...
CONFDIR="$(dirname "$(realpath "$0")")"
exec docker run -t -i --rm -v "$CONFDIR":/etc/openvpn:rw \
--network=host --security-opt=label=disable --cap-add=NET_ADMIN \
--entrypoint="${1:-bash}" ${IMAGE} "${@:2:$#}"
