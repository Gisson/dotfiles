# Lines configured by zsh-newuser-install
source ~/.bash_alias
export EDITOR=vim
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jorge/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/zsh-git-prompt/zshrc.sh

PROMPT='%F{yellow}[%T]%F{green}%n%f@%F{red}%m%f %F{blue}%1~%f %# '
RPROMPT='[%F{yellow}%?%f]'
