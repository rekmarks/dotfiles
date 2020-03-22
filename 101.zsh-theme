
#################################
##############     ##############
#################################

### misc

# print empty line before prompt
precmd() { print "" }

### colors

COLOR_RED=9
COLOR_GREEN=10
COLOR_WHITE=15
COLOR_LIGHT_ORANGE=215
COLOR_LIGHT_GRAY=255

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
ZSH_THEME_GIT_PROMPT_DIRTY="%F{$COLOR_RED}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{$COLOR_GREEN}"

### PROMPT

# %B start bold
# %b stop bold
# %F{x} start color "x"
# %f reset color
# %3~ show cwd: represent home as "~", only show three dir levels

# components
PROMPT_SYM="%F{$COLOR_WHITE}●○●"

PROMPT_PWD="%F{$COLOR_LIGHT_ORANGE}%3~"

PROMPT_GIT="$(custom_git_prompt_info)"

PROMPT_EXIT_CODE="%B%(?.%F{$COLOR_GREEN}*.%F{$COLOR_RED}*)%f%b"

# PROMPT
PROMPT='%B$PROMPT_SYM $PROMPT_PWD %f$PROMPT_GIT $PROMPT_EXIT_CODE%b
%F{$COLOR_LIGHT_GRAY}'

RPROMPT=""

#################################
##############     ##############
#################################
