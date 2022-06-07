source ~/.config/zsh/prompts/minimal.zsh-theme
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

#activating dir colors
test -r ~/.dir_colors && eval $(dircolors ~/.config/dir_colors)

# Aliases
alias ls="ls -a --color=auto"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)    #include hidden files

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/.zhistory

# stopwatch func
function stopwatch() {                 ~
    local BEGIN=$(date +%s)
    echo Starting Stopwatch...

    while true; do
        local NOW=$(date +%s)
        local DIFF=$(($NOW - $BEGIN))
        local MINS=$(($DIFF / 60))
        local SECS=$(($DIFF % 60))
        local HOURS=$(($DIFF / 3600))
        local DAYS=$(($DIFF / 86400))

        printf "\r%3d Days, %02d:%02d:%02d" $DAYS $HOURS $MINS $SECS
        sleep 0.5
    done
}

# command time
source ~/.config/zsh/plugins/zsh-command-time/zsh-command-time.zsh

# fish like auto suggestion
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#syntax highlighting should be at last
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
