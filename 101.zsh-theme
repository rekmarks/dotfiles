
#################################
##############     ##############
#################################

### misc

# print empty line before prompt (called by zsh)
precmd () { print "" }

### colors

COLOR_RED=9
COLOR_GREEN=10
COLOR_WHITE=15
COLOR_LIGHT_ORANGE=215
COLOR_LIGHT_GRAY=254

### git prompt

# exactly like git_prompt_info
function custom_git_prompt_info () {
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

### PROMPT

# static components
# zsh renders these correctly via its templating language
# %B start bold
# %b stop bold
# %F{x} start color "x"
# %f reset color
# %3~ show cwd: represent home as "~", only show three dir levels

PROMPT_SYM="%F{$COLOR_WHITE}●○●"

PROMPT_PWD="%F{$COLOR_LIGHT_ORANGE}%3~"

# uses: (<test>.<success>.<failure>)
PROMPT_EXIT_CODE="%B%(?.%F{$COLOR_GREEN}*.%F{$COLOR_RED}*)%f%b"

# dynamic components
# anything that's calculated, not just templated, must be calculated each time
# the prompt renders, i.e., its funciton must be called in the string assigned
# to PROMPT

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

# gets the left part of the prompt, including a pad, if any
get_prompt_left () {

  PROMPT_LEFT="%B$PROMPT_SYM $PROMPT_PWD $(custom_git_prompt_info) "

  # https://stackoverflow.com/a/10564427
  strip_invisible_pattern='%([BSUbfksu]|([FK]|){*})'

  PROMPT_LEFT_VISIBLE_LENGTH=${#${(S%%)PROMPT_LEFT//$~strip_invisible_pattern/}}
  PROMPT_PAD_SIZE=$(( $COLUMNS - ${PROMPT_LEFT_VISIBLE_LENGTH} - 1 ))

  echo "$PROMPT_LEFT$(get_pad $PROMPT_PAD_SIZE)"
}

# PROMPT
PROMPT='$(get_prompt_left)$PROMPT_EXIT_CODE%b
%F{$COLOR_LIGHT_GRAY}'

# we don't want this
RPROMPT=""

#################################
##############     ##############
#################################
