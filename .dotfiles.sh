#!/bin/bash
echo ">Beginning installation of dotfiles"
pdir=$(dirname $(realpath $0))
ln -sf $pdir/.colors/ $HOME
ln -sf $pdir/.config/ $HOME
ln -sf $pdir/.scripts/ $HOME
ln -sf $pdir/.xinitrc $HOME
ln -sf $pdir/.Xresources $HOME
ln -sf $pdir/.bashrc $HOME
ln -sf $pdir/.arch.png $HOME/pictures/.arch.png
echo ">Finished installation of dotfiles"
