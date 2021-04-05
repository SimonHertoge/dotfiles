set fish_greeting
# set fish_color_command brred
# set fish_color_error red --bold
set -x ANSIBLE_NOCOWS 1
set -x BROWSER firefox-developer-edition
set -x EDITOR nvim
set -x FISH_CLIPBOARD_CMD 'cat > /dev/null'
set -x FZF_CTRL_T_COMMAND "fd -H"
set -x FZF_DEFAULT_OPTS "-e --height 40% --layout reverse --border --preview 'bat --color always --line-range :500 {}' --color 'border:#FFFFFF'"
set -x LS_COLORS 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32'
set -x MOZ_X11_EGL 1
set -x PATH $PATH:/home/simon/scripts/
set -x TERM xterm
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x WINEARCH win32
set -x WINEDEBUG fixme-all
set -x WINEPREFIX /home/simon/.wine32

# . $HOME/.config/fish/functions/fish_fix_title.fish
