
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

# ignore duplicates in history
setopt HIST_IGNORE_DUPS

# ignore spaces in history
setopt HIST_IGNORE_SPACE

#append into history file
setopt INC_APPEND_HISTORY

#set history size
export HISTSIZE=10000

#save history after logout
export SAVEHIST=10000

#history file
export HISTFILE=~/.zhistory

# Add timestamp to history
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S "

#################################
########### OH MY ZSH! ##########
#################################

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

source $ZSH/oh-my-zsh.sh

#################################
############# macOS #############
#################################

# enable global terminal colors on macOS
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#################################
############# SHELL #############
############ ALIASES ############
#################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

# ls alias: list symlinks in directory
lss() {
    local dir="."
    if [ ! -z "$1" ]; then
        dir=$1
    fi
    find $dir -maxdepth 1 -type l -ls
}

# misc convenience aliases
alias ,='cd ..'
alias n='nvim'
alias c='clear'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# set copy/paste helper functions
# the per1 step removes the final newline from the output
alias pbcopy="per1 -pe 'chomp if eof' | xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# upgrade
alias upgrade="sudo apt-get update && sudo apt-get upgrade"

# re-execute zsh to reset source 
so() {
  exec zsh
}

#################################
############# TOOLS #############
##############  &  ##############
########### LANGUAGES ###########
#################################

### python

alias py='python3'
alias py2='python'

# PYENV installation
# https://github.com/pyenv/pyenv/wiki
# PYENV_ROOT="$HOME/.pyenv"
# if [ -d "$PYENV_ROOT" ]
# then
#   export PYENV_ROOT
#   PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init -)"
#   eval "$(pyenv virtualenv-init -)"
# fi

### go

# GOPATH
export GOPATH=$HOME/workspaces/go
export GOBIN=$HOME/workspaces/go/bin

### node

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### rust

PATH="$HOME/.cargo/bin:$PATH"

### android

export ANDROID_HOME=$HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$ANDROID_HOME/platform-tools

#################################
############## FIN ##############
#################################

# export PATH
export PATH="/usr/local/bin:$PATH"
