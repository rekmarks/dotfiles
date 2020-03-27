#! /bin/sh

# create nvim dir in ~/.config if it does not exist
if [ ! -d "~/.config/nvim"]
then
  mkdir -p "~/.config/nvim" # recursive mkdir, "p" for "parent"
fi

# create nvm directory if it doesn't exist
if [ ! -d "~/.nvm"]
then
  mkdir "~/.nvm"
fi

# symlink .vimrc from neovim directory
ln -s ~/.config/nvim/init.vim ~/.vimrc

# install homebrew packages
brew install yarn
brew install nvim
brew install tmux
brew install git
brew link --force git

# junegunn/vim-plug
./update_vim_plug.sh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# tmux plugin manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# run file migration script
./migrate_files.sh
