#! /bin/sh

# set these manually
PYTHON_3_VERSION="3.10.0"
PYTHON_2_VERSION="2.7.18"

sudo pacman install pyenv

pyenv install ${PYTHON_3_VERSION}
pyenv install ${PYTHON_2_VERSION}
