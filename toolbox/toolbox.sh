#!/bin/bash
CONTAINER_ID="toolbox-${UID}-$(echo $@ | md5sum - | head -c 16)"

# Try to enter a running container...
docker exec -it "$CONTAINER_ID" bash 2> /dev/null || \

docker run -it --rm --name="$CONTAINER_ID" --cap-add={NET,SYS}_ADMIN \
-v "${HOME}/Downloads:/root/Downloads" \
"$@" nightling/toolbox:"$TAG"
