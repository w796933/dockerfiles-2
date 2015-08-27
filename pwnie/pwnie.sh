#!/bin/bash
CONTAINER_ID="pwnie-${UID}-$(echo $@ | md5sum - | head -c 16)"

# Try to enter a running container...
docker exec -it "$CONTAINER_ID" bash 2> /dev/null || \

docker run -it --rm --name="$CONTAINER_ID" --cap-add=SYS_ADMIN \
-v "${HOME}/Downloads:/root/Downloads" \
"$@" nightling/pwnie
