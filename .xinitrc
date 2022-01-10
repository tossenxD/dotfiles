#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

nitrogen --restore & # wallpaper
xsetroot -cursor_name left_ptr # cursor
xset r rate 300 50 # speed
xset -b # bell
xrdb ~/.Xresources # urxvt terminal

# us-altgr-international keymap with super instead of caps
# sudo localectl set-x11-keymap us "" altgr-intl  caps:super

# start
exec bspwm
