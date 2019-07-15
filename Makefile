#!/usr/bin/make -f
.PHONY: install uninstall dist
version=0.1

all: install

install: zsh-git-prompt ~/.config/awesome ~/.zshrc ~/.Xresources ~/.screenrc ~/.bashrc ~/.vimrc ~/.vim/bundle ~/.bash_aliases ~/.xprofile ~/.xinitrc

zsh-git-prompt:
	git clone https://github.com/olivierverdier/zsh-git-prompt.git

~/.vimrc: 
	ln -sf ~/dotfiles/.vimrc ~/.vimrc

~/.xinitrc:
	ln -sf ~/dotfiles/.xinitrc ~/.xinitrc 

~/.screenrc:
	ln -sf ~/dotfiles/.screenrc ~/.screenrc

~/.xprofile:
	ln -sf ~/dotfiles/.xprofile ~/.xprofile

~/.Xresources:
	ln -sf ~/dotfiles/.Xresources ~/.Xresources

~/.zshrc:
	ln -sf ~/dotfiles/.zshrc ~/.zshrc

~/.config/awesome:
	ln -sf ~/dotfiles/.config/awesome ~/.config/awesome

~/.bash_aliases:
	ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases

~/.vim/bundle:
	mkdir -p ~/.vim/bundle
	$$(git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim)
	vim \+PluginInstall \+qall


~/.bashrc:
	ln -sf ~/dotfiles/.bashrc ~/.bashrc


dist:
	mkdir -p dotfiles-${version}
	cp -r .vimrc .screenrc .Xresources .zshrc .config .bash* dotfiles-${version}
	tar czf dotfiles-${version}.tar.gz dotfiles-${version}
	rm -rf dotfiles-${version}


uninstall:
	-unlink ~/.vimrc
	-unlink ~/.screenrc
	-unlink ~/.zshrc
	-unlink ~/.Xresources
	-unlink ~/.config/awesome
	-rm -rf zsh-git-prompt
	-rm -rf ~/.vim/bundle
