alias d='docker'
alias dexec='docker exec -it'
alias dgc='docker ps -aqf status=dead -f status=exited -f status=created | xargs -r docker rm'
alias dgcimg='docker images -qf dangling=true | xargs -r docker rmi'
alias dgcvol='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias dhist='docker history'
alias dimg='docker images'
alias dinspect-ip='docker inspect -f {{.NetworkSettings.IPAddress}} --type=container'
alias dinspect='docker inspect'
alias dnet='docker network'
alias dps='docker ps -a --format="table {{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'
alias drun='docker run -it --rm'
alias dvol='docker volume'
alias dxargs='xargs -n1 -r docker'
alias dxargsi='xargs -n1 -r -I{} docker'
alias fig='docker-compose'

dvertest() {
  A=$(docker version -f {{.Client.Version}} | awk -F. '{printf("%03d%03d%03d",$1,$2,$3)}')
  B=$(echo "$1" | awk -F. '{printf("%03d%03d%03d",$1,$2,$3)}')
  test $A -ge $B
}

dcleanup() {
  dgc -f -v
  dgcimg
  dvertest 1.9 && dgcvol
}

dimggrep() {
  docker images | tail -n+2 | grep -v '<none>' | grep "$@" | awk '{print $1":"$2}'
}

dpsgrep() {
  docker ps --format='{{.Names}}\t{{.Image}}\t{{.Status}}' | grep "$@" | awk '{print $1}'
}

dstats() {
  dpsgrep "$@" | xargs -r docker stats --no-stream=true
}

dupdate() {
  dimggrep "$@" | xargs -L1 -P3 -r docker pull
}

dlogs() {
  case `docker inspect -f '{{.HostConfig.LogConfig.Type}}' --type=container "${!#}" 2> /dev/null \
    || docker info | grep -m1 'Logging Driver' | awk '{print $(NF)}'` in
  journald)
    journalctl "${@:1:$#-1}" CONTAINER_NAME="${!#}";;
  *)
    docker logs "$@" | less;;
  esac
}
