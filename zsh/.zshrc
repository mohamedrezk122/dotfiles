#zmodload zsh/zprof

export ZSH_CONF="$HOME/.config/zsh"
export ZSH="$ZSH_CONF/.oh-my-zsh"

# ignore duplicates and spaces 
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

 
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"


bindkey "^[q" execute-named-cmd
bindkey -r "^[x"
bindkey -s "^f" 'fzf | xargs -r xdg-open^M'

# autoload -Uz compinit
# for dump in $ZSH_CONF/.zcompdump(N.mh+24); do
#   compinit
# done
# compinit -C

# autoload -Uz compinit
# compinit

autoload -Uz compinit 
if [[ -n /home/rezk/.config/zsh/.zcompdump(#qN.mh+24) ]]; then
  # echo "here"
  compinit -i 
else
 	compinit -C
fi  


source $ZSH/oh-my-zsh.sh
## very very slow
# source $ZSH_CONF/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## very very fast ; use either 
source $ZSH_CONF/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 
# source $ZSH_CONF/plugins/F-Sy-H/F-Sy-H.plugin.zsh

# source $ZSH_CONF/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh 

source $ZSH_CONF/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.bashrc

# export PROMPT_DIRTRIM=3
# export PROMPT="%B%F{3}[%n%f@%F{1}%m%f%b %F{100}%(4~|.../%2~|%~)%f %B%F{3}]%f%b $ "

# >>> conda initialize >>>
if [ 1 -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rezk/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rezk/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rezk/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#HISTFILE="~/$ZSH_CONF/.zsh_history"

host=$(hostname)
host_name=""
if [ "$host" != "Devil" ]; then
    container_id=$(echo $host | cut -d "." -f 1)
    host_name="($container_id)" 
	if [[ "$host_name" == "(asmarine)" ]]; then 
        source "$ZSH_CONF/asmarine.sh"
    fi
  else
  	source ~/.bash_aliases
	colorscript -e 45
fi

export PROMPT='%B%F{yellow}${host_name}%f%b %B%F{cyan}%c%f%b %B%F{202}>%f%b '


autoload -U colors && colors	# Load colors

HISTSIZE=10000000
SAVEHIST=10000000


#zprof
