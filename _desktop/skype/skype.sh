#!/bin/bash
NAME="skype-${USER}"
DATA="${HOME}/.Skype"

if [[ "$1" =~ ^-*(h|v)|(help|version)$ ]]; then
	docker run --rm quay.io/oszi/skype "$1"
	exit 0
fi

if [ -f "${DATA}/shared.xml" ]; then
	PORTS=`egrep -o 'Port>[0-9]+' "${DATA}/shared.xml" | egrep -o '[0-9]+' | uniq | \
	awk '{printf " -p %1$d:%1$d/tcp -p %1$d:%1$d/udp", $1}'`
fi

if [ "$(docker inspect -f '{{ .State.Running }}' "$NAME" 2> /dev/null)" == "true" ]; then
	docker exec "$NAME" skype "$@" &
else
	mkdir -p "$DATA"
	docker rm -fv "$NAME" 2> /dev/null
	docker run -du $UID:$GID --name="$NAME" --cap-drop=ALL \
	--security-opt=label:disable \
	-v /etc/group:/etc/group:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /run/user/$UID/pulse:/run/user/$UID/pulse:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
	-v "$DATA":/data/.Skype \
	-v "$HOME"/Downloads:/data/Downloads \
	${PORTS} quay.io/oszi/skype:"$TAG" "$@"
fi
