# 🛠 dotfiles

![Current terminal appearance](./current_terminal.png)

## Usage

- Platform
  - [Manjaro Linux](https://manjaro.org/) Linux, or possibly any distroy with `pacman`
- For reloading `.zshrc` without restarting
  - `so`
  - Note that `exit` and restart is recommended
- For reloading `.vimrc` without restarting vim
  - `:so ~/.vimrc`
- To migrate dotfiles
  - `yarn m`

## Recovery

> Some zsh plugins must be installed manually, see [below](#packages-frameworks).

Attempt a fresh install by running `yarn install:fresh` or `./scripts/fresh_install.sh`.
If the script fails, see its contents for manual steps.

### Gotchas

- `pyenv`
  - Check that the desired versions are listed in `scripts/install/install_python.sh`
  - Sometimes after updating, you have to run `pyenv rehash` to properly update PATH

## Packages & Frameworks

- [Neovim](https://neovim.io/)
  - [vim-plug](https://github.com/junegunn/vim-plug)
- [nvm](https://github.com/nvm-sh/nvm)
- [Oh My ZSH!](https://ohmyz.sh/)
- Manually installed zsh plugins
  - [yarn-autocompletions](https://github.com/g-plane/zsh-yarn-autocompletions)
- [pyenv](https://github.com/pyenv/pyenv)
- [tmux](https://github.com/tmux/tmux/)
  - [TPM](https://github.com/tmux-plugins/tpm)
