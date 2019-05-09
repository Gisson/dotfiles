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


HISTFILESIZE=2000

#shopt -s checkwinsize

force_color_prompt=yes
if [[ $(uname) = "Darwin" ]];then
	alias ls="ls -G"
	export PATH="$PATH:/usr/local/bin"
elif [[ $(uname) = "Linux" ]];then
	alias ls="ls --color=auto"
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias awsprod='aws eks --region us-east-1 update-kubeconfig --name production && export CLOUD_ENV=awsprod'
alias awsstg='aws eks --region eu-west-1 update-kubeconfig --name staging && export CLOUD_ENV=awsstg'
alias gcpprod='~/google-cloud-sdk/bin/gcloud container clusters get-credentials production --zone us-east1-b --project production-158815 && export CLOUD_ENV=gcpprod'
alias gcpstg='~/google-cloud-sdk/bin/gcloud container clusters get-credentials k8s-staging --zone europe-west1-d --project staging-158815 && export CLOUD_ENV=gcpstg'
alias gcploadtest='~/google-cloud-sdk/bin/gcloud container clusters get-credentials loadtest --zone europe-west1 --project staging-158815 && export CLOUD_ENV=loadtest'

if [[ -f ~/.kube/config ]];then
	if [[ $(cat ~/.kube/config  | grep "current-context" | grep "arn:aws:eks:us-east-1:506714715093:cluster/production" ) ]] ;then
		export CLOUD_ENV="awsprod"
	elif [[ $(cat ~/.kube/config  | grep "current-context" | grep "arn:aws:eks:eu-west-1:506714715093:cluster/staging" ) ]] ;then
		export CLOUD_ENV="awsstg"
	elif [[ $(cat ~/.kube/config  | grep "current-context" | grep "gke_production-158815_us-east1-b_production" ) ]] ;then
		export CLOUD_ENV="gcpprod"
	elif [[ $(cat ~/.kube/config  | grep "current-context" | grep "gke_staging-158815_europe-west1-d_k8s-staging" ) ]] ;then
		export CLOUD_ENV="gcpstg"
	elif [[ $(cat ~/.kube/config | grep "current-context" | grep "gke_staging-158815_europe-west1_loadtest") ]];then
		export CLOUD_ENV="loadtest"
	elif ! [[ $(cat ~/.kube/config | grep "current-context") ]];then
		export CLOUD_ENV=""
	else
		export CLOUD_ENV="unknown"
	fi
fi

function printawsenv {
	red="\e[31m"
	yellow="\e[33m"
	green="\e[32m"
	white="\e[00m"
	if [[ $AWS_ENV = "prod" ]];then
		echo -n "prod"
		#export __aws_ps1="(${red}prod)${white}"
	elif [[ $AWS_ENV = "stg" ]];then
		echo -n "stg"
		#export __aws_ps1="(${green}stg)${white}"
	else
		echo -n "(${yellow}unknown)${white}"
	fi

}


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

PS1_PREFIX='\[\033[33m\][\t]\[\033[1;32m\]\u@\h:\[\033[34m\]\w'

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


export EDITOR=vim

if [ -f ~/.bashrc_extra ];then
  . ~/.bashrc_extra
fi
