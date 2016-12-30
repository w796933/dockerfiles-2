#!/bin/bash -eu
. /etc/sysconfig/containers/toolbox
NAME=${NAME}-${RANDOM}
eval exec $(docker inspect -f {{.Config.Labels.RUN}} ${IMAGE}) '"$@"'