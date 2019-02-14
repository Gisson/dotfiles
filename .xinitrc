DEFAULT_SESSION=awesome

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile
case $1 in
	awesome)
	exec awesome
	;;
	*)
	exec $DEFAULT_SESSION
	;;
esac
