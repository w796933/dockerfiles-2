#!/bin/bash -eu
IMAGE=...
NAME=toolbox-${RANDOM}
OPTS=(-ite TERM --rm --name=${NAME})
while [ $# -ge 1 ]; do
  case "$1" in
  :*) IMAGE=$(echo ${IMAGE} | sed -r 's/:\w*$//')${1};;
  -*) OPTS+=("$1");;
   *) break;;
  esac
  shift
done
exec docker run "${OPTS[@]}" "${IMAGE}" "$@"
