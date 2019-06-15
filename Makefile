#!/usr/bin/make -f

deps:
ifeq ("$(wildcard zsh-git-prompt)","")
	git clone https://github.com/olivierverdier/zsh-git-prompt.git
endif


install: deps
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/.screenrc ~/.screenrc
	ln -sf ~/dotfiles/.Xresources ~/.Xresources
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	mkdir -p ~/.config/awesome
	ln -sf ~/dotfiles/.config/awesome/rc.lua ~/.config/awesome/rc.lua


uninstall:
	unlink ~/.vimrc
	unlink ~/.screenrc
	unlink ~/.zshrc
	unlink ~/.Xresources
	unlink ~/.config/awesome/rc.lua
ifneq ("$(wildcard zsh-git-prompt)","")
	rm -rf zsh-git-prompt
endif
