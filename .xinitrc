#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xsetroot -cursor_name left_ptr                             # cursor
xset r rate 300 50                                         # cursor speed
xset -b                                                    # bell
xrdb ~/.Xresources                                         # terminal
setxkbmap us "" altgr-intl altwin:swap_alt_win,caps:escape # keymap
nitrogen --restore &                                       # wallpaper
# old keymap <-> sudo localectl set-x11-keymap us "" altgr-intl caps:esc

# start some session
#exec bspwm
exec icewm-session
