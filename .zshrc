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
#
# make emacs server work
alias emacs=/usr/local/bin/emacs
#
# make `ls' colorized:
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#export LS_OPTIONS='--color=auto'
eval "`dircolors`"
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
precmd () { __git_ps1 "[%n@%m]" "%~%% "$'\n' "(%s)" }
