# 🛠 dotfiles
current bash and vim settings

## usage
- for reloading .vimrc without restarting vim
  - `:so ~/.vimrc`

## recovery
- first:
  - install `homebrew` from (brew.sh)[https://brew.sh]
  - `brew install nvim`
  - `brew install tmux`
  - for nvim plugin manager, `junegunn/vim-plug`, run:
    - `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
  - for `pyenv`, run `xcode-select --install` before installing using `homebrew`
- finally:
  - ensure the `~/.config/nvim/` directory exists
  - to migrate files, run: `chmod +x migrate_files.sh && ./migrate_files.sh`
    - macOS doesn't recognize `.bashrc`, so this script copies over a dummy
    `.bash_profile` file, among other things
  - `ln -s ~/.config/nvim/init.vim ~/.vimrc`
    - this creates a symbolic link named `.vimrc` in the home directory

### packages
- (Homebrew)[https://brew.sh]
- (Neovim)[https://neovim.io/]
  - (`junegunn/vim-plug`)[https://github.com/junegunn/vim-plug]
- (tmux)[https://github.com/tmux/tmux/]
- [pyenv](https://github.com/pyenv/pyenv)
  - [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

