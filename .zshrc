# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PATH=$PATH:~/bin:~/dev/git/depot_tools
setopt share_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate _yum
zstyle ':completion:*' list-colors ''
zstyle :compinstall filename '~/.zshrc'
autoload -Uz colors && colors
autoload -Uz compinit
compinit
setopt autolist automenu
# End of lines added by compinstall

# Make emacs server work
alias emacs=/usr/local/bin/emacs

# Make `ls' more colorized:
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias gl1="git log --decorate --oneline"
alias gl="git log --decorate"

export DISPLAY=:0.0

eval "`dircolors`"

if [ -z $SSH_AGENT_PID ]; then
  echo "~/.zshrc: Starting SSH Agent!"
  eval `ssh-agent` && ssh-add ~/.ssh/id_rsa
  echo "~/.zshrc: SSH Agent running (PID: $SSH_AGENT_PID)"
else
  echo "~/.zshrc: SSH Agent already running (PID: $SSH_AGENT_PID)"
fi

# Include git prompt and colorized info
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWCOMMITHASH=true
precmd () { __git_ps1 "[%n@%m]" "%~ %% "$'\n' "%s" }

if [ -e /home/rasendorf/.nix-profile/etc/profile.d/nix.sh ]; then . /home/rasendorf/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
