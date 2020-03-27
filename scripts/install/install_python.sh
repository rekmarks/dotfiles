#! /bin/sh

# set these manually
PYTHON_3_VERSION="3.7.7"
PYTHON_2_VERSION="2.7.17"

brew install pyenv
brew install pyenv-virtualenv

pyennv install ${PYTHON_3_VERSION}
pyennv install ${PYTHON_2_VERSION}

rm -rf ~/.pyenv/versions/neovim3
rm -rf ~/.pyenv/versions/neovim2

pyenv virtualenv ${PYTHON_3_VERSION} neovim3
pyenv virtualenv ${PYTHON_2_VERSION} neovim2
