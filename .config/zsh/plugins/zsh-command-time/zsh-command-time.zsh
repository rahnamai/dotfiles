_command_time_preexec() {
# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=1

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"

# Message color.
ZSH_COMMAND_TIME_COLOR="magenta"

# Exclude some commands 'write in inside the parentheses'
ZSH_COMMAND_TIME_EXCLUDE=()

  # check excluded
  if [ -n "$ZSH_COMMAND_TIME_EXCLUDE" ]; then
    cmd="$1"
    for exc ($ZSH_COMMAND_TIME_EXCLUDE) do;
      if [ "$(echo $cmd | grep -c "$exc")" -gt 0 ]; then
        # echo "command excluded: $exc"
        return
      fi
    done
  fi

  timer=${timer:-$SECONDS}
  ZSH_COMMAND_TIME_MSG=${ZSH_COMMAND_TIME_MSG}
  ZSH_COMMAND_TIME_COLOR=${ZSH_COMMAND_TIME_COLOR}
  export ZSH_COMMAND_TIME=""
}

_command_time_precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if [ -n "$TTY" ] && [ $timer_show -ge ${ZSH_COMMAND_TIME_MIN_SECONDS:-3} ]; then
      export ZSH_COMMAND_TIME="$timer_show"
      if [ ! -z ${ZSH_COMMAND_TIME_MSG} ]; then
        zsh_command_time
      fi
    fi
    unset timer
  fi
}

zsh_command_time() {
  if [ -n "$ZSH_COMMAND_TIME" ]; then
    timer_show=$(printf '%dH:%02dM:%02dS\n' $(($ZSH_COMMAND_TIME/3600)) $(($ZSH_COMMAND_TIME%3600/60)) $(($ZSH_COMMAND_TIME%60)))
    print -P "%F{$ZSH_COMMAND_TIME_COLOR}$(printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show")%f"
  fi
}

#zsh_command_time() {
#   if [ -n "$ZSH_COMMAND_TIME" ]; then
#        hours=$(($ZSH_COMMAND_TIME/3600))
#        min=$(($ZSH_COMMAND_TIME/60))
#        sec=$(($ZSH_COMMAND_TIME%60))
#        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
#            timer_show="$fg[green]$ZSH_COMMAND_TIME s."
#        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
#            timer_show="$fg[yellow]$min min. $sec s."
#        else
#            if [ "$hours" -gt 0 ]; then
#                min=$(($min%60))
#                timer_show="$fg[red]$hours h. $min min. $sec s."
#            else
#                timer_show="$fg[red]$min min. $sec s."
#            fi
#        fi
#        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
#    fi
#}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)
