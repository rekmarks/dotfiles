
#################################
##############     ##############
#################################

### colors etc.

COLOR_GREEN=9
COLOR_RED=10
COLOR_WHITE=15
COLOR_LIGHT_ORANGE=215
COLOR_LIGHT_GRAY=255

PROMPT_SYM="●○●"

### git prompt

# exactly like git_prompt_info, except parse_git_dirty happens before
function custom_git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}"
# ZSH_THEME_GIT_PROMPT_ADDED=" ✚"

### PROMPT

# %B start bold
# %b stop bold
# %F{x} start color "x"
# %f reset color
# %3~ show cwd: represent home as "~", only show three dir levels

PROMPT='%B%F{COLOR_WHITE}$PROMPT_SYM %F{$COLOR_LIGHT_ORANGE}%3~ %f$(custom_git_prompt_info) %b
%F{$COLOR_LIGHT_GRAY}%'

RPROMPT=""

#################################
##############     ##############
#################################
