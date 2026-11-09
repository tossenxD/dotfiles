#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xsetroot -cursor_name left_ptr                            # cursor
xset r rate 300 50                                        # cursor speed
xset -b                                                   # bell
xrdb ~/.Xresources                                        # terminal
setxkbmap -option                                         # reset options
setxkbmap us altgr-intl altwin:swap_lalt_lwin,caps:escape # keymap
nitrogen --restore &                                      # wallpaper

# <bspwm,icewm-session>
exec icewm-session
