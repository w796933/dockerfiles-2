alias d='docker'
alias dexec='docker exec -it'
alias dgc='docker ps -aqf status=dead -f status=exited -f status=created | xargs -r docker rm'
alias dgcimg='docker images -qf dangling=true | xargs -r docker rmi'
alias dgcvol='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias dhist='docker history'
alias dimg='docker images'
alias dinsp='docker inspect'
alias dinsp-ip='docker inspect -f {{.NetworkSettings.IPAddress}} --type=container'
alias dnet='docker network'
alias dnetinsp='docker network inspect'
alias dps='docker ps -a --format="table {{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'
alias drun='docker run --rm -ite TERM'
alias dupdate='docker update'
alias dvol='docker volume'
alias dvolinsp='docker volume inspect'
alias dxargs='xargs -n1 -r docker'
alias fig='docker-compose'

dvertest() {
  A=$(docker version -f {{.Client.Version}} | awk -F. '{printf("%03d%03d%03d",$1,$2,$3)}')
  B=$(echo "$1" | awk -F. '{printf("%03d%03d%03d",$1,$2,$3)}')
  test $A -ge $B
}

dcleanup() {
  dgc -f
  dvertest 1.9 && dgcvol
  dgcimg
}

dimggrep() {
  docker images | tail -n+2 | grep "$@" | awk '{if ($1!="<none>") print $1":"$2}'
}

dpsgrep() {
  docker ps -a --format='{{.Names}}\t{{.Image}}\t{{.Status}}' | grep "$@" | awk '{print $1}'
}

drmgrep() {
  dpsgrep "$@" | xargs -r docker rm --force
}

dstats() {
  dpsgrep "$@" | xargs -r docker stats --no-stream
}

dpullgrep() {
  dimggrep "$@" | xargs -L1 -P3 -r docker pull
}

dpushgrep() {
  dimggrep "$@" | xargs -n1 -r docker push
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
