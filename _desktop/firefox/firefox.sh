#!/bin/bash
NAME="firefox-${USER}"
DATA="${HOME}/.mozilla/.docker"

if [[ "$1" == "-h" ]] || [[ "$1" == *"help" ]]; then
	docker run --rm nightling/firefox -h
	exit 0
fi

if [ "$(docker inspect -f '{{ .State.Running }}' "$NAME" 2> /dev/null)" == "true" ]; then
	docker exec "$NAME" firefox "$@" &
else
	mkdir -p "$DATA"
	docker rm -fv "$NAME" 2> /dev/null
	docker run -du $UID:$GID --name="$NAME" --cap-drop=ALL \
	--device=/dev/dri:/dev/dri:rw \
	-v /etc/group:/etc/group:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /run/user/$UID/pulse:/run/user/$UID/pulse:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
	-v "$DATA":/data/.mozilla \
	-v "$HOME"/.config/gtk-3.0/settings.ini:/data/.config/gtk-3.0/settings.ini:ro \
	-v "$HOME"/Downloads:/data/Downloads \
	nightling/firefox:"$TAG" "$@"
fi
