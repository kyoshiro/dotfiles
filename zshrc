# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle :compinstall filename '~/.zshrc'

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
