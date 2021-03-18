#! /bin/sh

# set these manually
PYTHON_3_VERSION="3.9.2"
PYTHON_2_VERSION="2.7.18"

brew install pyenv
brew install pyenv-virtualenv

pyenv install ${PYTHON_3_VERSION}
pyenv install ${PYTHON_2_VERSION}

rm -rf ~/.pyenv/versions/neovim3
rm -rf ~/.pyenv/versions/neovim2

pyenv virtualenv ${PYTHON_3_VERSION} neovim3
pyenv virtualenv ${PYTHON_2_VERSION} neovim2
