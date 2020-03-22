# 🛠 dotfiles

## usage

- for reloading `.zshrc` without restarting
  - `so`
  - note that `exit` and restart is recommended
- for reloading `.vimrc` without restarting vim
  - `:so ~/.vimrc`
- to migrate dotfiles
  - `yarn m`

## recovery

- first:
  - install `homebrew` from [brew.sh](https://brew.sh)
  - Oh My ZSH!
    - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  - `pyenv` requirement:
    - `xcode-select --install`
- then, attempt automatic reinstall:
  - `./fresh_install.sh`
  - install script does _not_ install `pyenv`
  - if the script fails, see contents for manual steps
- finally
  - In a running instance of `nvim`
    - `:PlugInstall`
    - `:so ~/.vimrc`
  - remaining packages
    - `brew install pyenv`
      - `pyenv install ...` desired versions
      - `brew install pyenv-virtualenv`
    - `brew install yarn`
  - GPG signing
    - [download](https://gpgtools.org/)
    - if you were smart and saved your GPG key, you can reuse it
    - whatever the case, follow [these instructions](https://help.github.com/en/articles/managing-commit-signature-verification)

## packages used

- [Homebrew](https://brew.sh)
- [Neovim](https://neovim.io/)
  - [vim-plug](https://github.com/junegunn/vim-plug)
- [NVM](https://github.com/nvm-sh/nvm)
- [Oh My ZSH!](https://ohmyz.sh/)
- [pyenv](https://github.com/pyenv/pyenv)
  - [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
- [tmux](https://github.com/tmux/tmux/)
  - [TPM](https://github.com/tmux-plugins/tpm)
