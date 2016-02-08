TOOLBOX=$(. /etc/sysconfig/containers/toolbox/toolbox && echo ${IMAGE})

toolbox() {
  drun "${TOOLBOX}" "$@"
}

ptoolbox() {
  drun --privileged "${TOOLBOX}" "$@"
}

ctoolbox() {
  drun --privileged --net="container:$1" --ipc="container:$1" --pid=host \
  --volumes-from="$1" "${TOOLBOX}" "${@:2:$#}"
}

htoolbox() {
  (IMAGE=${TOOLBOX}; NAME=''; \
  eval $(docker inspect -f {{.Config.Labels.RUN}} ${IMAGE}) '"$@"')
}

alias toolbox-privileged='ptoolbox'
alias toolbox-attach='ctoolbox'
alias toolbox-host='htoolbox'
