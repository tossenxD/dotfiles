#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GPG_TTY=$(tty)

if [ "$(tty)" = "/dev/tty1" ]; then
  export __GLX_VENDOR_LIBRARY_NAME=amdgpu
  export DRI_PRIME=0
  export GTK_THEME=Adwaita:dark
  export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
  export QT_STYLE_OVERRIDE=Adwaita-Dark
  exec sway --unsupported-gpu
fi

if [ "$(tty)" = "/dev/tty2" ]; then
  exec startx
fi
