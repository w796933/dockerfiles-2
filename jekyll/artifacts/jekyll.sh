#!/bin/bash -eu
SUDO_UID=$(id -u)
SUDO_GID=$(id -g)
. /etc/sysconfig/containers/jekyll
eval exec $(docker inspect -f {{.Config.Labels.RUN}} ${IMAGE}) '"$@"'