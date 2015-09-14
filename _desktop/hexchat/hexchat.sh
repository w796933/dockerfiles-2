#!/bin/bash
NAME="hexchat-${USER}"
DATA="${HOME}/.config/hexchat"

if [[ "$1" =~ ^-*(h|v)|(help|version)$ ]]; then
	docker run --rm quay.io/nightling/hexchat "$1"
	exit 0
fi

if [ "$(docker inspect -f '{{ .State.Running }}' "$NAME" 2> /dev/null)" == "true" ]; then
	docker exec "$NAME" hexchat --existing "$@" &
else
	mkdir -p "$DATA"
	docker rm -fv "$NAME" 2> /dev/null
	docker run -du $UID:$GID --name="$NAME" --cap-drop=ALL \
	-v /etc/group:/etc/group:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /run/user/$UID/pulse:/run/user/$UID/pulse:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
	-v "$DATA":/data/.config/hexchat \
	-v "$HOME"/Downloads:/data/Downloads \
	quay.io/nightling/hexchat:"$TAG" "$@"
fi
