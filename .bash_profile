# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	eval `$SSHAGENT $SSHAGENTARGS`
	trap "kill $SSH_AGENT_PID" 0
fi

# Color definitions:
RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
GREEN='\[\e[0;32m\]'
BLUE='\[\e[1;34m\]'
DARKBROWN='\[\e[1;33m\]'
DARKGRAY='\[\e[1;30m\]'
LIGHTBLUE='\[\033[1;36m\]'
PURPLE='\[\e[1;35m\]'
NOCOLOR='\[\e[0m\]'

# checks if branch has something pending
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo " (*)"
}

# gets the current git branch
function parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

# get last commit hash prepended with @ (i.e. @8a323d0)
function parse_git_hash() {
	git rev-parse --short HEAD 2> /dev/null | sed "s/\(.*\)/\[\1\]/"
}

export PS1="\u@\h \[\033[32m\]\w\[\033[1;31m\]\$(parse_git_branch)\[\033[00m\]\[\e[33m\]\$(parse_git_hash)\[\e[1;31m\]\$(parse_git_dirty)\[\e[0m\] $ "
