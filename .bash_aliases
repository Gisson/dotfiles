alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias awsprod='ln -sf ~/.kube/aws-prod ~/.kube/config'
alias awsstg='ln -sf ~/.kube/aws-stg ~/.kube/config'
alias gcpstg='ln -sf ~/.kube/gcp-stg ~/.kube/config'
alias gcpprod='ln -sf ~/.kube/gcp-prod ~/.kube/config'
#alias gcpprod='ln -sf ~/.kube/aws-prod ~/.kube/config && export CLOUD_ENV=gcpprod'
#alias gcpstg='~/google-cloud-sdk/bin/gcloud container clusters get-credentials k8s-staging --zone europe-west1-d --project staging-158815 && export CLOUD_ENV=gcpstg'
#alias gcploadtest='~/google-cloud-sdk/bin/gcloud container clusters get-credentials loadtest --zone europe-west1 --project staging-158815 && export CLOUD_ENV=loadtest'
if [[ $(uname) = "Darwin" ]];then
	alias ls="ls -G"
elif [[ $(uname) = "Linux" ]];then
	alias ls="ls --color=auto"
fi
