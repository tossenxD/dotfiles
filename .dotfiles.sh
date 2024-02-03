#!/bin/bash
echo ">Beginning installation of dotfiles"
PDIR=$(dirname $(realpath $0))
ln -sf $PDIR/.config/bspwm $HOME/.config
ln -sf $PDIR/.config/polybar $HOME/.config
ln -sf $PDIR/.config/sxhkd $HOME/.config
ln -sf $PDIR/.xinitrc $HOME
ln -sf $PDIR/.Xresources $HOME

ln -sf $PDIR/.config/sway $HOME/.config
ln -sf $PDIR/.config/swappy $HOME/.config
ln -sf $PDIR/.config/waybar $HOME/.config
ln -sf $PDIR/.config/alacritty $HOME/.config
ln -sf $PDIR/.config/wofi $HOME/.config
ln -sf $PDIR/.config/icewm $HOME/.config

ln -sf $PDIR/.config/nvim/init.vim $HOME/.config/nvim
ln -sf $PDIR/.config/nvim/plugconfigs $HOME/.config/nvim
ln -sf $PDIR/.config/nvim/syntax $HOME/.config/nvim

ln -sf $PDIR/.bashrc $HOME
ln -sf $PDIR/.bash_profile $HOME
ln -sf $PDIR/.config/ranger $HOME/.config
ln -sf $PDIR/.config/zathura $HOME/.config

ln -sf $PDIR/.colors $HOME
ln -sf $PDIR/.urxvt $HOME
ln -sf $PDIR/.scripts $HOME

echo ">Finished installation of dotfiles"
