#
# ~/.bash_profile
#

export PATH=$PATH:~/.gem/ruby/2.4.0/bin:~/scripts:~/.emacs.d/bin
export PAGER='less -M +Gg'
#export MPD_HOST=~/.config/mpd/socket

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
[[ -f ~/.bashrc ]] && . ~/.bashrc

