#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PS1='[\u@\h \W]\$ '

# Basic aliases, more in fish
alias ls='ls --color=auto -al'
alias grep='grep -i --color=auto'
alias pg='ps aux | grep --color=auto'
alias ka='killall'

export BROWSER="firefox-developer-edition"
export EDITOR="vim"
export FZF_CTRL_T_COMMAND="fd -H -E '/mnt/'"

exec fish
