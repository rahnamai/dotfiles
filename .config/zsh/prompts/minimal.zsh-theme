#!/bin/zsh
autoload -U colors && colors	# Load colors
setopt PROMPT_SUBST

PROMPT_SIGN="$"
ERR_COLOR=red
NORMAL_COLOR=magenta
USER_COLOR=yellow
HOST_COLOR=cyan
BRACKETS_COLOR=red
AT_SIGN_COLOR=green
DIRECTORY_COLOR=magenta
ME='%f%F{$BRACKETS_COLOR}[%F{$USER_COLOR}%n%f%F{$AT_SIGN_COLOR}@%F{$HOST_COLOR}%m%f%F{$BRACKETS_COLOR}]%'
SHORTEND_DIRECTORY='%F{$DIRECTORY_COLOR}%(5~|%-1~/…/%3~|%4~)%f'  
FULL_DIRECTORY='%F{$DIRECTORY_COLOR}%~%f'  
SIGN="(?.%F{$NORMAL_COLOR}.%F{$ERR_COLOR})"


PROMPT='$ME$SIGN$PROMPT_SIGN%f '
RPROMPT='$FULL_DIRECTORY' 