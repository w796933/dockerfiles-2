#!/bin/bash -eu
IMAGE=$(egrep -rh '^IMAGE=' /etc/sysconfig/containers/backup | head -n1 | cut -d= -f2)
NAME=backup-${RANDOM}
DOCKER_OPTS=''
while [ $# -ge 1 ]; do
  case "$1" in
  :*) IMAGE=$(echo ${IMAGE} | sed -E 's/:\w*$//')${1};;
  -*) DOCKER_OPTS="${DOCKER_OPTS} ${1}";;
   *) break;;
  esac
  shift
done
eval exec $(docker inspect -f {{.Config.Labels.RUN}} ${IMAGE}) '"$@"'
