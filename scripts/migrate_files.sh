#! /bin/sh

migrate_files() {

  local return_code=0

  eval_shared_return_code() {
    eval $1
    if (( $? != 0 )); then
      return_code=1
    fi
  }

  eval_shared_return_code "cp ./dotfiles/.gitconfig ~" # global git config
  eval_shared_return_code "cp ./dotfiles/.gitignore ~" # global gitignore
  eval_shared_return_code "cp ./dotfiles/.vimrc ~/.config/nvim/init.vim" # neovim
  eval_shared_return_code "cp ./dotfiles/.zshrc ~" # zsh config
  eval_shared_return_code "cp ./dotfiles/.tmux.conf ~" # tmux
  eval_shared_return_code "cp ./themes/oh-my-zsh/101.zsh-theme ~/.oh-my-zsh/custom/themes" # oh-my-zsh theme

  return ${return_code}
}

migrate_files
