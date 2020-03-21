# 🛠 dotfiles

current zsh and vim settings

## usage

- for reloading `.zshrc` without restarting
  - `source ~/.zshrc`
- for reloading `.vimrc` without restarting vim
  - `:so ~/.vimrc`
- to migrate dotfiles
  - `./migrate_files.sh`

## recovery

- first:
  - install `homebrew` from [brew.sh](https://brew.sh)
  - Oh My ZSH!
    - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  - `pyenv` requirement:
    - `xcode-select --install`
- then, attempt automatic reinstall:
  - `./fresh_install.sh`
  - **Note:** install script does not install `pyenv`
- if that fails, go manual:
  - `nvim`
    - `mkdir -p ~/.config/nvim/`
    - `brew install nvim`
  - `brew install tmux`
  - `junegunn/vim-plug`:
    - `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
  - `nvm`
    - `mkdir ~/.nvm/`
    - `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash`
  - `./migrate_files.sh`
  - `ln -s ~/.config/nvim/init.vim ~/.vimrc`
    - this creates a symbolic link named `.vimrc` in the home directory
  - `git`
    - `brew install git`
    - `brew link --force git`
- finally
  - In a running instance of `nvim`
    - `:PlugInstall`
    - `:so ~/.vimrc`
  - Remaining packages
    - `brew install pyenv`
      - `pyenv install ...` desired versions
      - `brew install pyenv-virtualenv`
    - `brew install yarn`
  - GPG signing
    - Download: https://gpgtools.org/
    - If you were smart and saved your GPG key, you can reuse it
    - Whatever the case, follow instructions on: https://help.github.com/en/articles/managing-commit-signature-verification

## packages used

- [Homebrew](https://brew.sh)
- [Neovim](https://neovim.io/)
  - [`junegunn/vim-plug`](https://github.com/junegunn/vim-plug)
- [tmux](https://github.com/tmux/tmux/)
- [Node Version Manager (`nvm`)](https://github.com/nvm-sh/nvm)
- [pyenv](https://github.com/pyenv/pyenv)
  - [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
