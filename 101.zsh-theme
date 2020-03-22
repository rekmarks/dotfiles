
#################################
##############     ##############
#################################

### misc

# print empty line before prompt (called by zsh)
precmd () { print "" }

# gets string padding
get_pad () {
  pad=""
  current_len=0
  target_len=$1

  if (( $target_len > 0 )); then
    while (( $current_len < $target_len )); do
      pad=$pad" "
      let current_len=current_len+1
    done
  fi
  echo $pad
}

### colors

COLOR_RED=9
COLOR_GREEN=10
COLOR_WHITE=15
COLOR_LIGHT_ORANGE=215
COLOR_LIGHT_GRAY=255

### git prompt

# exactly like git_prompt_info, except parse_git_dirty happens before
function custom_git_prompt_info () {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}"

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

# get prompt pad
PROMPT_LEFT="%B$PROMPT_SYM $PROMPT_PWD $PROMPT_GIT " # for sizing only
PROMPT_PAD_SIZE=$(( $COLUMNS - ${#PROMPT_LEFT} - 2 )) # we're off-by-2 somewhere
PROMPT_PAD=$(get_pad $PROMPT_PAD_SIZE)

# PROMPT
# must call parse_git_dirty in here, for unknown reasons
PROMPT='%B$PROMPT_SYM $PROMPT_PWD $(parse_git_dirty)$PROMPT_GIT $PROMPT_PAD$PROMPT_EXIT_CODE%b
%F{$COLOR_LIGHT_GRAY}'

RPROMPT=""

#################################
##############     ##############
#################################
