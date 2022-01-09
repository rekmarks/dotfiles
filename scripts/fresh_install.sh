#!/usr/bin/env bash

# create nvim dir in ~/.config if it does not exist
mkdir -p ~/.config/nvim

# create nvm directory if it doesn't exist
mkdir -p ~/.nvm

# symlink .vimrc from neovim directory
ln -s ~/.config/nvim/init.vim ~/.vimrc

# omz
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

# install required packages
sudo pacman -Syu gpg nvim tmux git xclip xsel jq

# python
./scripts/install/install_python.sh

# junegunn/vim-plug
./scripts/install/install_vim_plug.sh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# tmux plugin manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# run file migration script
./scripts/migrate_files.sh

# Install vim plugins per init.vim
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
