#!/bin/bash
CONTAINER_ID="electrum-${UID}"

docker rm -v "$CONTAINER_ID" 2> /dev/null

docker run -d -h electrum --name="$CONTAINER_ID" \
--cap-drop=ALL --cap-add={AUDIT_WRITE,CHOWN,SETGID,SETUID} \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/machine-id:/etc/machine-id:ro \
-v /run/user/${UID}/pulse:/run/user/pulse:ro \
-v "${HOME}/.electrum:/data/.electrum" \
-v "${HOME}/Downloads:/data/Downloads" \
-e XUID=${UID} -e XGID=${GID} \
nightling/electrum $@
