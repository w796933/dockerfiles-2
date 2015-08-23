#!/bin/bash
CONTAINER_ID="libreoffice-${UID}-$(echo $@ | md5sum - | head -c 16)"
CONFIG="${HOME}/.config/libreoffice"
RUN_OPTS=(-w /mnt)
CMD_OPTS=()

if [[ "$1" == "-h" ]] || [[ "$1" == *"help" ]]; then
	docker run --rm nightling/libreoffice -h
	exit 0
fi

while [ $# -gt 0 ]; do
	x=$1
	if [[ "$x" == "file://"* ]]; then
		x=${x:7}
		x=$(printf '%b' "${x//%/\\x}")
	fi
	if [ -d "$x" ]; then
		source=$(realpath "$x")
		target=/mnt/$#-$(basename "$source")
		RUN_OPTS+=(-v "${source}:${target}")
	elif [ -f "$x" ]; then
		source=$(dirname "$(realpath "$x")")
		target=/mnt/$#-$(basename "$source")
		RUN_OPTS+=(-v "${source}:${target}")
		CMD_OPTS+=(\"${target}/$(basename "$x")\")
	else
		CMD_OPTS+=("$x")
	fi
    shift
done

mkdir -p "$CONFIG"

docker run -d --name="$CONTAINER_ID" \
--cap-drop=ALL --cap-add={AUDIT_WRITE,CHOWN,SETGID,SETUID} \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/machine-id:/etc/machine-id:ro \
-v /run/user/${UID}/pulse:/run/user/pulse:ro \
-v "${CONFIG}:/data/.config/libreoffice" \
-v "${HOME}/Downloads:/data/Downloads" \
-v "${HOME}/Public:/data/Public" \
-v "${HOME}/Templates:/data/Templates" \
-e XUID=${UID} -e XGID=${GID} \
"${RUN_OPTS[@]}" nightling/libreoffice "${CMD_OPTS[@]}"

sh -c "docker wait ${CONTAINER_ID} && docker rm -v ${CONTAINER_ID}" &
