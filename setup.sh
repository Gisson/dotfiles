#!/bin/sh
install_command="pacman -S"

while getopts "d:" opt;do
	case ${opt} in
		d)
			case ${OPTARG} in 
				arch)
					install_command="pacman -S"
					;;
				gentoo)
					install_command="emerge -v"
					;;
				*)
					echo "Unrecognized distro. Falling back to arch"
					install_command="pacman -S"
					;;
			esac
			echo "Using ${OPTARG}"
			;;
		*)
			echo "Unexpected option"
			;;
	esac
done

[[ $(command -v zsh ) ]] && printf "zsh already installed!\n" || $($install_command zsh)
if ! [[ -d ~/zsh-git-prompt ]];then
  printf "Repository zsh-git-prompt is required. Proceed? [Enter to continue, Ctrl-c to exit]"
  read
  pushd .
  cd ~
  git clone https://github.com/olivierverdier/zsh-git-prompt.git
  popd
else
  printf "zsh-git-prompt requirement already installed\n"
fi

if [[ -f ~/.zshrc ]];then
  printf "$HOME/.zshrc already exists. Do you which to replace it by ELIMINATING the existing? [Enter to continue, Ctrl-c to exit]"
  read
  cp ~/.zshrc ~/.zshrc.bak
fi
ln -sf $(pwd)/.zshrc ~/.zshrc

if [[ -f ~/.vimrc ]];then
  printf "$HOME/.vimrc already exists. Do you which to replace it by ELIMINATING the existing? [Enter to continue, Ctrl-c to exit]"
  read
  cp ~/.vimrc ~/.vimrc.bak
fi
ln -sf $(pwd)/.vimrc ~/.vimrc

if [[ -f ~/.Xresources ]];then
  cat .Xresources >> ~/.Xresources
fi
printf "Everything is now ready!\n"
