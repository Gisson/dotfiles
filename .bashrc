# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

function suspend {
	echo -n "mem" >/sys/power/state;
}

function build_ps1 {

if [[ $(whoami) = "root" ]];then
	PS1_PREFIX='\[\033[33m\][\t]\[\033[1;31m\]\u@\h:\[\033[34m\]\w'
else
	PS1_PREFIX='\[\033[33m\][\t]\[\033[1;32m\]\u@\h:\[\033[34m\]\w'
fi

PS1_MIDDLE=""
if [[ $(uname) = "Darwin" ]];then
	if [ -f ~/.git-prompt.sh ];then
		source ~/.git-prompt.sh
		PS1_MIDDLE='\[\033[37m\]$(__git_ps1)\[\033[92m\]'
	fi
elif [[ $(uname) = "Linux" ]];then
	if [ -f /usr/share/git/git-prompt.sh ];then
		. /usr/share/git/git-prompt.sh
		PS1_MIDDLE='\[\033[37m\]$(__git_ps1)\[\033[92m\]'
	fi
fi

if ! [[ -z ${CLOUD_ENV} ]];then
	PS1_MIDDLE="${PS1_MIDDLE} \[\033[37m\](${CLOUD_ENV})\[\033[00m\]"
fi

PS1_POSTFIX="\$\[\033[00m\] "

export PS1="${PS1_PREFIX} ${PS1_MIDDLE} ${PS1_POSTFIX}"

}

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend


HISTFILESIZE=2000

#shopt -s checkwinsize

force_color_prompt=yes
if [[ $(uname) = "Darwin" ]];then
	export PATH="/usr/local/opt/terraform@0.11/bin:$PATH:/usr/local/bin"
fi

(which go && export PATH="${PATH}:${HOME}/go/bin") &>/dev/null


if [[ -f ~/.kube/config ]];then
	if [[ $(cat ~/.kube/config  | grep "current-context" | grep "arn:aws:eks:us-east-1:506714715093:cluster/production" ) ]] ;then
		export CLOUD_ENV="awsprod"
	elif [[ $(cat ~/.kube/config  | grep "current-context" | grep "arn:aws:eks:eu-west-1:506714715093:cluster/staging" ) ]] ;then
		export CLOUD_ENV="awsstg"
	elif [[ $(cat ~/.kube/config  | grep "current-context" | grep "gke_production-158815_us-east1-b_production" ) ]] ;then
		export CLOUD_ENV="gcpprod"
	elif [[ $(cat ~/.kube/config  | grep "current-context" | grep "gke_staging-158815_europe-west1-d_k8s-staging" ) ]] ;then
		export CLOUD_ENV="gcpstg"
	elif ! [[ $(cat ~/.kube/config | grep "current-context") ]];then
		export CLOUD_ENV=""
	else
		export CLOUD_ENV="unknown"
	fi
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


export EDITOR=vim
build_ps1

if [ -f ~/.bashrc_extra ];then
  . ~/.bashrc_extra
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH="$PATH:/home/jorge/rpi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin"
