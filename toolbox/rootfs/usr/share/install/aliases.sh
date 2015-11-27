toolbox() {
  docker run -it -e TERM --rm "__IMAGE__" "$@"
}

ctoolbox() {
  docker run -it -e TERM --rm --privileged --volumes-from="$1" \
  --net="container:$1" --ipc="container:$1" --pid=host \
  "__IMAGE__" "${@:2:$#}"
}

alias toolbox-attach='ctoolbox'

htoolbox() {
  IMAGE="__IMAGE__"
  eval $(docker inspect -f {{.Config.Labels.RUN}} ${IMAGE}) '"$@"'
}

alias toolbox-host='htoolbox'
