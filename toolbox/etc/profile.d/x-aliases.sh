alias ll='ls -alFh --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'

alias chr="chroot ${HOST:-/host}"
alias c='chr coredumpctl'
alias j='chr journalctl'
alias m='chr machinectl'
alias n='chr networkctl'
alias s='chr systemctl'

alias a='atomic'
alias e='etcdctl'
alias k='kubectl'
