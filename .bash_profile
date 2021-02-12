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

if [ -z $SSH_AGENT_PID ]; then
  echo "~/.bash_profile: Starting SSH Agent!"
  eval `ssh-agent` && ssh-add ~/.ssh/id_rsa
  echo "~/.bash_profile: SSH Agent running (PID: $SSH_AGENT_PID)"
else
  echo "~/.bash_profile: SSH Agent already running (PID: $SSH_AGENT_PID)"
  if [ "$(ssh-add -l)" == "The agent has no identities." ]; then
    echo "~/.bash_profile: SSH Agent adding SSH Key:"
    ssh-add
  fi
fi


#pars for fun: install | remove | rollback
function apt-history(){

      case "$1" in
        install)
              grep 'install ' /var/log/dpkg.log | awk '{ print $1" "$2" "$3" "$4 }'
              ;;
        upgrade|remove)
              grep $1 /var/log/dpkg.log
              ;;
        rollback)
              grep upgrade /var/log/dpkg.log | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
			grep '(install|upgrade|remove|rollback)' /var/log/dpkg.log | awk '{ print $1" "$2" "$3" "$4 }'
              ;;
      esac
}

# Color definitions:
RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
LIGHTGREEN='\[\e[1;32m\]'
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

export PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[1;31m\]\$(parse_git_branch)\[\033[00m\]\[\e[33m\]\$(parse_git_hash)\[\e[1;31m\]\$(parse_git_dirty)\[\e[0m\] $ "

export PATH=$PATH:~/bin
#export DISPLAY=:0.0
#export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0
#export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 # in WSL 2
