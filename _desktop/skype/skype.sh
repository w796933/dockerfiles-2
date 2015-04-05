#!/bin/bash
CONFIG="${HOME}/.Skype/shared.xml"
CONTAINER_ID="skype-${UID}"
OPTS="-e XUID=${UID} -e XGID=${GID}"

if [ -f "$CONFIG" ]; then
	PORTS=`egrep -o 'Port>[0-9]+' "$CONFIG" | egrep -o '[0-9]+' | uniq | \
awk '{printf " -p %1$d:%1$d -p %1$d:%1$d/udp", $1}'`
	OPTS="${OPTS} ${PORTS}"
fi

docker rm -v "$CONTAINER_ID" 2> /dev/null

docker run -d -h skype --name="$CONTAINER_ID" \
--cap-drop=ALL --cap-add={AUDIT_WRITE,CHOWN,SETGID,SETUID} \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/machine-id:/etc/machine-id:ro \
-v /run/user/${UID}/pulse:/run/user/pulse:ro \
-v "${HOME}/.Skype:/data/.Skype" \
-v "${HOME}/Downloads:/data/Downloads" \
${OPTS} nightling/skype $@
