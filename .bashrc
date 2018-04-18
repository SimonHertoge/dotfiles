#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PS1='[\u@\h \W]\$ '
PATH=$PATH:/home/simon/.gem/ruby/2.4.0/bin

# Basic aliases, more in fish
alias ls='ls --color=auto -al'
alias grep='grep -i --color=auto'
alias pg='ps aux | grep --color=auto'
alias ka='killall'

export EDITOR="vim"
export FZF_CTRL_T_COMMAND='ag --hidden --ignore='/mnt/' -g ""' 
export PAGER='less -M +Gg'

exec fish
