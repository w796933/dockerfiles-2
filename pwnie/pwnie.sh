#!/bin/bash
NAME="pwnie-${UID}-$(echo "$TAG" "$@" | md5sum - | head -c 16)"

docker create --name="$NAME" --security-opt=label:disable \
-e TERM -v "$HOME"/Downloads:/root/Downloads "$@" \
quay.io/oszi/pwnie:"$TAG" sleep inf 2> /dev/null

docker start "$NAME" 2> /dev/null

docker exec -it "$NAME" bash

[ "$(docker top "$NAME" 2> /dev/null | wc -l)" -le 2 ] &&
	docker kill "$NAME" &> /dev/null
