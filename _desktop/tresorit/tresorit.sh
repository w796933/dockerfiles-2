#!/bin/bash
NAME="tresorit-${USER}"
DATA="${HOME}/.local/share/tresorit"

if [ "$(docker inspect -f '{{ .State.Running }}' "$NAME" 2> /dev/null)" == "true" ]; then
	docker exec "$NAME" tresorit "$@" &
else
	mkdir -p "$DATA"/{Logs,Profiles,Updates}
	docker rm -fv "$NAME" 2> /dev/null
	docker run -du $UID:$GID --name="$NAME" --cap-drop=ALL \
	-v /etc/group:/etc/group:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /run/user/$UID/pulse:/run/user/$UID/pulse:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
	-v "$DATA":/data/.tresorit \
	-v "$HOME"/Downloads:/data/Downloads \
	-v "$HOME"/Public:/data/Public \
	quay.io/nightling/tresorit:"$TAG" "$@"
fi
