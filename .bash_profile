#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GPG_TTY=$(tty)

if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

if [ "$(tty)" = "/dev/tty2" ]; then
  exec startx
fi
