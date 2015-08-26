# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ll='ls -alFh --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias c='coredumpctl'
alias j='journalctl'
alias n='networkctl'
alias m='machinectl'
alias s='systemctl'
alias e='etcdctl'
alias k='kubectl'
