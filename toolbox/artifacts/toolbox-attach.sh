#!/bin/bash -eu
if [ $# -eq 0 ]; then
  echo "Usage: toolbox-attach <container> [command]" >&2
  exit 1
fi

exec "$(dirname "$0")"/toolbox.sh --privileged \
--pid=host --{network,ipc}="container:$1" \
--volumes-from="$1" "${@:2:$#}"
