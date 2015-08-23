#!/bin/bash
OPTS="$@"

if [[ "${!#}" != *"://"* ]]; then
	OPTS[-1]="https://www.youtube.com/watch?v=${!#}"
fi

"$(dirname "$(realpath "$0")")"/mpv.sh \
--ytdl-format="'bestvideo[height<=?1440]+bestaudio/best'" "${OPTS[@]}"
