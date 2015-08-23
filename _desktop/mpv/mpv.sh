#!/bin/bash
CONFIG="${HOME}/.config/mpv"
CMD_OPTS="$@"

if [ -f "${!#}" ]; then
	RUN_OPTS=(-v "$(dirname "$(realpath "${!#}")")":/mnt/mpv:ro -w /mnt/mpv)
	CMD_OPTS[-1]=\"$(basename "${!#}")\"
fi

mkdir -p "$CONFIG"

docker run -it --rm -e XUID=${UID} -e XGID=${GID} \
--cap-drop=ALL --cap-add={AUDIT_WRITE,CHOWN,SETGID,SETUID} \
--device=/dev/dri:/dev/dri:rw \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY="unix${DISPLAY}" \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/machine-id:/etc/machine-id:ro \
-v /run/user/${UID}/pulse:/run/user/pulse:ro \
-v "${CONFIG}:/data/.config/mpv" \
"${RUN_OPTS[@]}" nightling/mpv "${CMD_OPTS[@]}"
