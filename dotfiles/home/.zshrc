# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#################################
############## ZSH ##############
#################################

export ZSH=$HOME/.oh-my-zsh

# http://zsh.sourceforge.net/Doc/Release/Options.html

# Ignore duplicates in history
setopt HIST_IGNORE_DUPS

# Ignore spaces in history
setopt HIST_IGNORE_SPACE

# Append into history file
setopt INC_APPEND_HISTORY

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename
# generation, etc. (An initial unquoted ‘~’ always produces named directory
# expansion.)
setopt EXTENDED_GLOB

# Set history size
export HISTSIZE=50000

# Save history after logout
export SAVEHIST=10000

# History file location
export HISTFILE=~/.zhistory

# Add timestamp to history
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

#################################
########### OH MY ZSH! ##########
#################################

# This is part of the theme config
export NEW_LINE_BEFORE_PROMPT=-1
alias clear="NEW_LINE_BEFORE_PROMPT=-1 && clear"

export ZSH_THEME="101"

plugins=(
  git # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
  node # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/node
  nvm # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm
  pyenv # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pyenv
  yarn # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn
  tmux # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
  vscode # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode
  web-search # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
)

ZSH_PYENV_QUIET=true

source $ZSH/oh-my-zsh.sh

#################################
############# macOS #############
#################################

# Enable global terminal colors on macOS
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#################################
############# SHELL #############
############ ALIASES ############
#################################

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some ls aliases
alias l='ls -CF'
alias la='ls -A' # Shows all files without metadata
alias lg='ls | grep'
alias ll='ls -la'

# ls alias: list symlinks in directory
lss () {
    local dir="."
    if [ ! -z "$1" ]; then
        dir=$1
    fi
    find $dir -maxdepth 1 -type l -ls
}

# Misc. convenience aliases
alias ,='cd ..'
alias n='nvim'
alias c='clear'
alias home="cd ~ && clear"

# upgrade
alias upgrade="sudo apt-get update && sudo apt-get upgrade"

# Function for re-executing zsh to reset source 
so () {
  exec zsh
}

#################################
############# TOOLS #############
##############  &  ##############
########### LANGUAGES ###########
#################################

### tmux

alias tmx='tmux new'

### git
# note that the OMZ git plugin has lots of aliases
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git

# `force-with-lease`` allows e.g. rebases, but prevents overwriting commits by
# other people 
unalias gpf
alias gpf='git push --force-with-lease'

alias gpF='git push --force'

alias gfx='git commit --fixup HEAD'

# gaa = git add --all
alias gafx='gaa && gfx'

alias gafxp='gafx && gp'

# git log
alias glg='git log --stat --reverse'

unalias glo
glo () {
  local numCommits=20
  if [[ -n "$1" ]]; then
    numCommits=$1
  fi

  if [[ $numCommits -le 0 ]]; then
    git log --oneline --decorate --reverse
  else
    git log --oneline --decorate --reverse -n "${numCommits}"
  fi
}

# git checkout main || master 
unalias gcm
gcm () {
  (git show-ref --verify --quiet refs/heads/main && git checkout main) || git checkout master
}

# gcm && git pull
gcml () {
  gcm && gl
}

# git commit -am <MSG> && git push
gcap () {
  gcam $1 && gp
}

alias ghr="git rev-parse --short HEAD"

# Copy the HEAD shorthash, without a trailing newline
alias ghrcp="ghr | tr -d '\n' | pbcopy"

# Copy the fork point with the given base branch, without a trailing newline
gfp () {
  git merge-base --fork-point $1 | tr -d '\n' | pbcopy
}

# Recall that "gpsup" is:
# git push -u origin $(git_current_branch)

# git push -u <REMOTE> $(git_current_branch)
gpsu () {
  gp -u $1 $(git_current_branch)
}

# Add and commit everything and push up the current branch to origin.
gcapsup () {
  gaa && gcmsg $1 && gpsup
}

# Create a new branch, add and commit everything, and push up the new branch to
# origin.
gbpsup () {
  gcb $1 && gcapsup $2
}

# After updating a package, create a version bump branch and push it to the
# remote. Assumes the local has the version bump changes.
gpbump () {
  gbpsup $1 $1
}

### Python

alias py='python3'
alias py2='python'

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

### Go

# GOPATH
export GOPATH=$HOME/workspaces/go
export GOBIN=$HOME/workspaces/go/bin

### Node.js

# NVM already loaded by nvm plugin at this point
autoload -U add-zsh-hook
load_nvmrc () {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load_nvmrc

### Rust

PATH="$HOME/.cargo/bin:$PATH"

### Android

export ANDROID_HOME=$HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$ANDROID_HOME/platform-tools

#################################
############## FIN ##############
#################################

# Add local binaries to PATH and export it
export PATH="/usr/local/bin:$PATH"

# This must be called after exporting PATH
load_nvmrc
