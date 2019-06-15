#!/usr/bin/make -f
.PHONY: install uninstall

install: zsh-git-prompt ~/.config/awesome ~/.zshrc ~/.Xresources ~/.screenrc ~/.vimrc

zsh-git-prompt:
	git clone https://github.com/olivierverdier/zsh-git-prompt.git

~/.vimrc:
	ln -sf ~/dotfiles/.vimrc ~/.vimrc

~/.screenrc:
	ln -sf ~/dotfiles/.screenrc ~/.screenrc

~/.Xresources:
	ln -sf ~/dotfiles/.Xresources ~/.Xresources

~/.zshrc:
	ln -sf ~/dotfiles/.zshrc ~/.zshrc

~/.config/awesome:
	ln -sf ~/dotfiles/.config/awesome ~/.config/awesome




uninstall:
	-unlink ~/.vimrc
	-unlink ~/.screenrc
	-unlink ~/.zshrc
	-unlink ~/.Xresources
	-unlink ~/.config/awesome
	-rm -rf zsh-git-prompt
