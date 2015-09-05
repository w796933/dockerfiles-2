#!/bin/bash
NAME="libreoffice-${USER}"
DATA="${HOME}/.config/libreoffice"
RUN_OPTS=()
CMD_OPTS=()

if [[ "$1" =~ ^-*(h|v)|(help|version)$ ]]; then
	docker run --rm nightling/libreoffice "$1"
	exit 0
fi

while [ $# -gt 0 ]; do
	x=$1
	if [[ "$x" == "file://"* ]]; then
		x=${x:7}
		x=$(printf '%b' "${x//%/\\x}")
	fi
	if [ -d "$x" ]; then
		wdir=$(realpath "$x")
		RUN_OPTS+=(-v "${wdir}:/data/${wdir//\//_}")
	elif [ -f "$x" ]; then
		if [[ "$x" =~ "$HOME"/(Documents|Downloads|Public|Templates)/.* ]]; then
			CMD_OPTS+=("$(realpath -s --relative-base="$HOME" "$x")")
		else
			wdir=$(dirname "$(realpath "$x")")
			dest=${wdir//\//_}
			RUN_OPTS+=(-v "${wdir}:/data/${dest}")
			CMD_OPTS+=("${dest}/$(basename "$x")")
		fi
	else
		CMD_OPTS+=("$1")
	fi
    shift
done

if [ "$(docker inspect -f '{{ .State.Running }}' "$NAME" 2> /dev/null)" == "true" ]; then
	docker exec "$NAME" libreoffice "${CMD_OPTS[@]}" &
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
	-v "$DATA":/data/.config/libreoffice \
	-v "$HOME"/Documents:/data/Documents \
	-v "$HOME"/Downloads:/data/Downloads \
	-v "$HOME"/Public:/data/Public \
	-v "$HOME"/Templates:/data/Templates \
	"${RUN_OPTS[@]}" nightling/libreoffice:"$TAG" "${CMD_OPTS[@]}"
fi
