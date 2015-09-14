#!/bin/bash
docker run -it --rm --cap-add={NET,SYS}_ADMIN -e TERM "$@" \
-v "$HOME"/Downloads:/root/Downloads \
quay.io/nightling/toolbox:"$TAG"
