# XDG paths 
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_RUNTIME_DIR="/home/rezk/.cache/xdgr"

# home dotfiles
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
# export XAUTHORITY=/tmp/.Xauthority
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export PASSWORD_STORE_DIR="$XDG_CONFIG_HOME"/pass

export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export ROS_HOME=$XDG_DATA_HOME/ros
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc

#disable less history
export LESSHISTFILE=-

# ZSH path 
export ZDOTDIR=~/.config/zsh/
# . "$CARGO_HOME/env"

export PATH="$HOME/pkgs/pypy3.10-v7.3.16-linux64/bin:$PATH"
export PATH=/opt/texlive/2021/bin/x86_64-linux/:$PATH
export PATH="$HOME/pkgs/context/tex/texmf-linux-64/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/lib/gems/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="/usr/lib/:$PATH"

export NO_AT_BRIDGE=1
export GIT_EDITOR=subl4
export EDITOR=subl4
export GEM_HOME="$HOME/.local/lib/gems"

# export PYTHONPATH=${PYTHONPATH}:"/usr/lib/python3.12/:/usr/lib/python3.12/lib-dynload"
export PYTHONPATH=$PYTHONPATH:"/usr/local/python3.11.6/:/usr/local/python3.11.6/lib/python3.11/lib-dynload/"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/"
