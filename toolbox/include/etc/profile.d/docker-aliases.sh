docker_xargs='xargs --no-run-if-empty docker'

alias d='docker'
alias drun='docker run -it --rm'
alias dexec='docker exec -it'
alias dimg='docker images'
alias dps='docker ps -a --format="table {{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'
alias dinspect='docker inspect'
alias dinspect-ip='docker inspect -f "{{.NetworkSettings.IPAddress}}"'

dclean() {
	docker ps -aqf 'status=dead' -f 'status=exited' | $docker_xargs rm -fv
	docker images -qf 'dangling=true' | $docker_xargs rmi
}

dstats() {
	docker ps --format='{{.Names}}\t{{.Image}}' | grep "$@" | awk '{print $1}' \
	| $docker_xargs stats --no-stream=true
}

dupdate() {
	for img in $(docker images | tail -n+2 | awk '{print $1":"$2}' \
	| grep -v '<none>' | grep "$@"); do
		docker pull "$img"
	done
}
