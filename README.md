# 🛠 dotfiles
current bash and vim settings

## usage notes
- for reloading .vimrc without restarting vim
  - `:so ~/.vimrc`

## recovery notes
- for nvim plugin manager, `junegunn/vim-plug`, run:
  - `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
- `copy the content of `.vimrc` into `~/.config/nvim/init.vim` and run:
  - `ln -s ~/.config/nvim/init.vim ~/.vimrc
  - this creates a symbolic link named .vimrc in the home directory
- `for `pyenv`, run `xcode-select --install `before installing using `homebrew
- for migration scripts, run: chmod +x migrate_files.sh && ./migrate_files.sh

