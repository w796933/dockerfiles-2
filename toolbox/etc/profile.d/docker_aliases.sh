alias d='docker'
alias dbuild='docker build'
alias dcp='docker cp'
alias dcreate='docker create'
alias ddiff='docker diff'
alias dexec='docker exec -it'
alias dexec-priv='docker exec -itu root --privileged'
alias dgc='docker ps -aqf status=dead -f status=exited -f status=created | xargs -r docker rm'
alias dgcimg='docker images -qf dangling=true | xargs -r docker rmi'
alias dgcvol='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias dhist='docker history'
alias dimg='docker images'
alias dinsp='docker inspect'
alias dinsp-ip='docker inspect -f {{.NetworkSettings.IPAddress}} --type=container'
alias dkill='docker kill'
alias dnet='docker network'
alias dnetinsp='docker network inspect'
alias dpause='docker pause'
alias dps='docker ps -a --format="table {{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'
alias drestart='docker restart'
alias drun='docker run --rm -ite TERM'
alias dstart='docker start'
alias dstop='docker stop'
alias dunpause='docker unpause'
alias dupdate='docker update'
alias dvol='docker volume'
alias dvolinsp='docker volume inspect'
alias dxargs='xargs -n1 -r docker'
alias fig='docker-compose'

dcleanup() {
  dgc -f && dgcvol && dgcimg
}

dimggrep() {
  docker images | tail -n+2 | grep "$@" | awk '{if ($2!="<none>") print $1":"$2}'
}

dpsgrep() {
  docker ps -a --format='{{.Names}}\t{{.Image}}\t{{.Status}}' | grep "$@" | awk '{print $1}'
}

drmgrep() {
  dpsgrep "$@" | xargs -r docker rm --force
}

dstatsgrep() {
  dpsgrep "$@" | xargs -r docker stats --no-stream
}

dpullgrep() {
  dimggrep "$@" | xargs -L1 -P3 -r docker pull
}

dpushgrep() {
  dimggrep "$@" | xargs -n1 -r docker push
}

dlogs() {
  case `dinsp -f '{{.HostConfig.LogConfig.Type}}' --type=container "${!#}" 2> /dev/null \
    || docker info | grep -m1 'Logging Driver' | awk '{print $(NF)}'` in
  journald)
    journalctl "${@:1:$#-1}" CONTAINER_NAME="${!#}";;
  *)
    docker logs "$@" | less;;
  esac
}

dlabeleval() {
  if [ $# -lt 2 ]; then
    echo 'Usage: dlabeleval <image> <label> [args]' >&2 && false
  else
    local IMAGE=$1 INAME=$(echo $1 | awk -F/ '{print $(NF)}' | awk -F: '{print $1}')
    local NAME=${NAME:-${INAME}}
    local LABEL=$(dinsp -f '{{index .Config.Labels "'$2'"}}' ${IMAGE})
    if [ -z "${LABEL}" ]; then
      echo 'Image/Label not found!' >&2 && false
    else
      eval ${LABEL} "${@:3:$#}"
    fi
  fi
}
