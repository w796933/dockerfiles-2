alias d='docker'
alias drun='docker run -it --rm'
alias dexec='docker exec -it'
alias dimg='docker images'
alias dps='docker ps -a --format="table {{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'
alias dinspect='docker inspect'
alias dinspect-ip='docker inspect -f "{{.NetworkSettings.IPAddress}}"'

dclean() {
  docker ps -aqf 'status=dead' -f 'status=exited' -f 'status=created' | xargs -r docker rm -fv
  docker images -qf 'dangling=true' | xargs -r docker rmi
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
