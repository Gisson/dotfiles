DEFAULT_SESSION=awesome

[ -f ~/.xprofile ] && . ~/.xprofile
case $1 in
	awesome)
	exec awesome
	;;
	*)
	exec $DEFAULT_SESSION
	;;
esac
