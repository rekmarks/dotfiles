# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Add timestamp to history
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S "

#append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000

# why is this here?
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ,='cd ..'
alias n='nvim'
alias p='python3'
alias node='nodejs'
alias c='clear'

alias ga='git add .'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gc='git commit -m'
alias gpu='git pull'
alias gb='git branch'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


if [ -f ~/.bash/sensitive ]; then
    . ~/.bash/sensitive
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

# set copy/paste helper functions
# the per1 step removes the final newline from the output
alias pbcopy="per1 -pe 'chomp if eof' | xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# upgrade
alias upgrade="sudo apt-get update && sudo apt-get upgrade"

# reload bashrc
so() {
  source ~/.bashrc
}

# COLOR_BRIGHT_GREEN="\033[38;5;10m"
# COLOR_LIGHT_GREEN="\033[38;5;154m"
# COLOR_BRIGHT_BLUE="\033[38;5;115m"
# COLOR_LIGHT_BLUE="\033[38;5;86m"
# COLOR_LIGHT_RED="\033[38;5;196m"
# COLOR_YELLOW="\033[0;33m"
# COLOR_PURPLE="\033[1;35m"
# COLOR_BLUE="\033[34;5;115m"
# COLOR_LIGHT_CYAN="\033[1;36m"
# COLOR_GOLD="\033[38;5;142m"
# COLOR_SILVER="\033[38;5;248m"
COLOR_RESET="\033[0m"
COLOR_LIGHT_ORANGE="\033[38;5;215m"
COLOR_WHITE="\033[0;37m"

BOLD="$(tput bold)"

# Setting GIT prompt
COLOR_CYAN=`tput setaf 6`
COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
c_sgr0=`tput sgr0`

branch_color() {
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        color=""
        if git diff --quiet 2>/dev/null >&2
        then
            color=${COLOR_GREEN}
        else
            color=${COLOR_RED}
        fi
    else
        return 0
    fi
    echo -n $color
}

git_branch() {
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        gitver="["$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')"]"
    else
        return 0
    fi
echo -e $gitver
}

# Set Bash PS1
PS1_DIR="\[$BOLD\]\[$COLOR_LIGHT_ORANGE\]\w "
PS1_GIT="\[$BOLD\]\[\$(branch_color)\]\[$BOLD\]\$(git_branch)\[$COLOR_RESET\]"
# PS1_USR="\n\[$BOLD\]\[$COLOR_WHITE\]\u"
PS1_SYM="\[$BOLD\]\[$COLOR_WHITE\]●○●\[$COLOR_RESET\]"

PS1="${PS1_DIR}${PS1_GIT} ${PS1_SYM}\n "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Setting PATH for Sublime Text's subl command
PATH="/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export EDITOR='subl -w'

# PYENV installation
# https://github.com/pyenv/pyenv/wiki
PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]
then
  export PYENV_ROOT
  PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# python aliases
alias py='python3'
alias py2='python'

# Setting GOPATH for Golang
export GOPATH=$HOME/workspaces/go
export GOBIN=$HOME/workspaces/go/bin

# TODO
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enabling global terminal colors on macosx
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# bash completion?
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# export PATH
export PATH="~/.local/bin:$PATH"
