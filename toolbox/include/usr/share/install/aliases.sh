toolbox() {
  IMAGE="__IMAGE__"
  docker run --rm -it -e TERM -e IMAGE="$IMAGE" "$@" "$IMAGE"
}

ctoolbox() {
  toolbox --cap-add=NET_ADMIN --cap-add=SYS_ADMIN --security-opt=label:disable \
  --pid=host --net="container:${!#}" --ipc="container:${!#}" \
  --volumes-from="${!#}" "${@:1:$#-1}"
}

alias toolbox-attach='ctoolbox'

htoolbox() {
  IMAGE="__IMAGE__"
  OPT1="$@ -e TERM"
  eval $(docker inspect -f "{{.Config.Labels.RUN}}" "$IMAGE")
}

alias toolbox-host='htoolbox'
