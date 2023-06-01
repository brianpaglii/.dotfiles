#!/bin/bash

# update the system
sudo add-apt-repository multiverse
sudo apt update
sudo apt upgrade

# install build essentials
sudo apt install build-essential

# install node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# installing github
sudo apt install gh

# installing curl
sudo apt install curl

# installing i3
sudo apt install i3 feh

# installing terminal tools
sudo apt install kitty zsh tmux
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installing neovim
install_neovim() {
	curl -JLO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
	tar xzvf nvim-linux64.tar.gz
	rm -rdf nvim-linux64.tar.gz
	mv nvim-linux64 ~/.local/bin/
	ln -s ~/.local/bin/nvim-linux64/bin/nvim ~/.local/bin
}
install_neovim

# create symbolic links to .config
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/i3 ~/.config/i3
ln -s ~/.dotfiles/kitty ~/.config/kitty
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/JetBrains ~/.config/JetBrains
ln -s ~/.dotfiles/background ~/

# installing packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# move fonts
ln -s ~/.dotfiles/fonts ~/.fonts
sudo apt install ttf-mscorefonts-installer

# cache fonts to linux
fc-cache -fv

# login in gh
gh auth login

# install learning
cd
gh repo clone brianpaglii/learning
