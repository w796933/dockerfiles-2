#!/bin/bash
DATA="${HOME}/.config/mpv"
RUN_OPTS=()
CMD_OPTS=()

while [ $# -gt 0 ]; do
	x=$1
	if [[ "$x" == "file://"* ]]; then
		x=${x:7}
		x=$(printf '%b' "${x//%/\\x}")
	fi
	if [ -f "$x" ]; then
		wdir=$(dirname "$(realpath "$x")")
		hash=$(echo "$wdir" | md5sum - | head -c 16)
		RUN_OPTS+=(-v "${wdir}:/data/${hash}:ro")
		CMD_OPTS+=("${hash}/$(basename "$x")")
	else
		CMD_OPTS+=("$1")
	fi
    shift
done

docker run -itu $UID:$GID --rm --cap-drop=ALL \
--security-opt=label:disable \
--device=/dev/dri:/dev/dri:rw \
-v /etc/group:/etc/group:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/machine-id:/etc/machine-id:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /run/user/$UID/pulse:/run/user/$UID/pulse:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
-v "$DATA":/data/.config/mpv \
"${RUN_OPTS[@]}" quay.io/oszi/mpv:"$TAG" "${CMD_OPTS[@]}"
