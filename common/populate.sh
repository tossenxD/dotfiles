#! /usr/bin/env bash
PDIR=$(dirname $(realpath $0))
mkdir -p $HOME/.config

ln -sf $PDIR/.config/sway $HOME/.config
ln -sf $PDIR/.config/swappy $HOME/.config
ln -sf $PDIR/.config/waybar $HOME/.config
ln -sf $PDIR/.config/alacritty $HOME/.config
ln -sf $PDIR/.config/wofi $HOME/.config
ln -sf $PDIR/.config/workstyle $HOME/.config

ln -sf $PDIR/.emacs.d $HOME
ln -sf $PDIR/.config/nvim $HOME/.config
ln -sf $PDIR/.config/ranger $HOME/.config
ln -sf $PDIR/.config/zathura $HOME/.config

ln -sf $PDIR/.bashrc $HOME
ln -sf $PDIR/.bash_profile $HOME

ln -sf $PDIR/scripts $HOME
