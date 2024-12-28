#!/bin/sh
PDIR=$(dirname $(realpath $0))

ln -sf $PDIR/.config/bspwm $HOME/.config
ln -sf $PDIR/.config/polybar $HOME/.config
ln -sf $PDIR/.config/sxhkd $HOME/.config

ln -sf $PDIR/.config/icewm $HOME/.config

ln -sf $PDIR/.xinitrc $HOME
ln -sf $PDIR/.Xresources $HOME
ln -sf $PDIR/.colors $HOME
