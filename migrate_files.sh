#! /bin/sh

# copy over files
cp ./.vimrc ~/.config/nvim/init.vim # neovim
cp ./.bash_profile ~ && cp ./.bashrc ~ # bash config
cp ./.tmux.conf ~ # tmux

echo "migration complete"
