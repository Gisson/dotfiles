# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

#shopt -s checkwinsize

force_color_prompt=yes
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f /usr/share/git/git-prompt.sh ];then
  . /usr/share/git/git-prompt.sh
  PS1='\[\e[33m\][\t]\[\033[01;32m\]\u@\h:\[\e[34m\]\w\[\e[37m\]$(__git_ps1)\[\e[92m\]$\[\033[00m\] '
else
  PS1='\[\e[33m\][\t]\[\033[01;32m\]\u@\h:\[\e[34m\]\w\[\e[37m\]\[\e[92m\]$\[\033[00m\] '
fi

export EDITOR=vim
