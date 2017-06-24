#!/bin/bash -eu
IMAGE=...
NAME=toolbox-${RANDOM}
eval exec $(docker inspect -f {{.Config.Labels.RUN}} ${IMAGE}) '"$@"'
