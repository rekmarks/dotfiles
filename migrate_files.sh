#! /bin/sh

# copy over files
cp ./.vimrc ~/.config/nvim/init.vim # neovim
cp ./.zshrc ~ # zsh config
cp ./101.zsh-theme ~/.oh-my-zsh/custom/themes # zsh theme
cp ./.tmux.conf ~ # tmux

echo "migration script exit"
