#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PS1='[\u@\h \W]\$ '
PATH=$PATH:/home/simon/.gem/ruby/2.4.0/bin

alias ls='ls --color=auto -al'
alias grep='grep -i --color=auto'
alias pg='ps aux | grep --color=auto'
alias weather='curl wttr.in'
alias yt='youtube-dl -n --all-subs --convert-subs srt --add-metadata --hls-use-mpegts --skip-unavailable-fragments'
alias ka='killall'

export EDITOR="vim"
export FZF_CTRL_T_COMMAND='ag --hidden --ignore='/mnt/' -g ""' 

exec fish
