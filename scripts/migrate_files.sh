#!/bin/zsh

migrate_files() {

  local return_code=0

  # eval with shared return code
  _eval() {
    if ! eval "$1"; then
      return_code=1
    fi
  }

  _eval "cp ./dotfiles/home/*(D) ~"
  _eval "cp ./dotfiles/gpg/* ~/.gnupg" # nvm default packages
  _eval "cp ./dotfiles/misc/.vimrc ~/.config/nvim/init.vim" # neovim
  _eval "cp ./dotfiles/nvm/default-packages \"$NVM_DIR\"" # nvm default packages
  _eval "cp ./themes/oh-my-zsh/101.zsh-theme ~/.oh-my-zsh/custom/themes" # oh-my-zsh theme

  unset -f _eval

  return ${return_code}
}

migrate_files
