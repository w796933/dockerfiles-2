#!/bin/bash
mkdir -m 0777 -p /tmp/weevely

docker run -it --rm --cap-drop=ALL -v /tmp/weevely:/data \
-v "$HOME"/Downloads:/data/Downloads \
nightling/weevely "$@"
