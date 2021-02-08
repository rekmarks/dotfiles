#!/usr/bin/env bash

migrate_files() {

  local return_code=0

  # eval with shared return code
  _eval() {
    if ! eval "$1"; then
      return_code=1
    fi
  }

  _eval "cp ./dotfiles/.gitconfig ~" # global git config
  _eval "cp ./dotfiles/.gitignore ~" # global gitignore
  _eval "cp ./dotfiles/.vimrc ~/.config/nvim/init.vim" # neovim
  _eval "cp ./dotfiles/.zshrc ~" # zsh config
  _eval "cp ./dotfiles/.tmux.conf ~" # tmux
  _eval "cp ./dotfiles/nvm/default-packages \"$NVM_DIR\"" # nvm default packages
  _eval "cp ./themes/oh-my-zsh/101.zsh-theme ~/.oh-my-zsh/custom/themes" # oh-my-zsh theme

  unset -f _eval

  return ${return_code}
}

migrate_files
