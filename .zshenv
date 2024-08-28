# XDG paths 
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# ZSH path 
export ZDOTDIR=~/.config/zsh/

# disable less history
export LESSHISTFILE=-

export EDITOR=subl4
. "$HOME/.cargo/env"
