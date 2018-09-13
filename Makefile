#!/usr/bin/make -f

deps:
ifeq ("$(wildcard zsh-git-prompt)","")
	git clone https://github.com/olivierverdier/zsh-git-prompt.git
endif


install: deps
	ln -s ~/dotfiles/.vimrc ~/.vimrc 
	ln -s ~/dotfiles/.screenrc ~/.screenrc
	ln -s ~/dotfiles/.Xresources ~/.Xresources
	ln -s ~/dotfiles/.zshrc ~/.zshrc
	mkdir -p ~/.config/awesome
	ln -s ~/dotfiles/.config/awesome/rc.lua ~/.config/awesome/rc.lua


uninstall:
	unlink ~/.vimrc
	unlink ~/.screenrc
	unlink ~/.zshrc
	unlink ~/.Xresources
	unlink ~/.config/awesome/rc.lua
ifneq ("$(wildcard zsh-git-prompt)","")
	rm -rf zsh-git-prompt
endif
