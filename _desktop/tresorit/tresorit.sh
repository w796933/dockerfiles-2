#!/bin/bash
DATA="${HOME}/.local/share/tresorit"
CONTAINER_ID="tresorit-${UID}"

mkdir -p "$DATA"/{Logs,Profiles,Updates}

docker rm -v "$CONTAINER_ID" 2> /dev/null

docker run -d -h tresorit --name="$CONTAINER_ID" \
--cap-drop=ALL --cap-add={AUDIT_WRITE,CHOWN,SETGID,SETUID} \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/machine-id:/etc/machine-id:ro \
-v "${DATA}:/data/tresorit" \
-v "${HOME}/Downloads:/data/Downloads" \
nightling/tresorit $@
