#!/bin/bash
NAME="electrum-${USER}"
DATA="${HOME}/.electrum"

if [[ "$1" =~ ^-*(h|v)|(help|version)$ ]]; then
	docker run --rm nightling/electrum "$1"
	exit 0
fi

if [ "$(docker inspect -f '{{ .State.Running }}' "$NAME" 2> /dev/null)" == "true" ]; then
	docker exec "$NAME" electrum "$@" &
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
	-v "$DATA":/data/.electrum \
	-v "$HOME"/Downloads:/data/Downloads \
	nightling/electrum:"$TAG" "$@"
fi
