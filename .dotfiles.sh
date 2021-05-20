#!/bin/bash
echo ">Beginning installation of dotfiles"
pdir=$(dirname $(realpath $0))
ln -s $pdir/.colors/ $HOME
ln -s $pdir/.config/ $HOME
ln -s $pdir/.scripts/ $HOME
ln $pdir/.xinitrc $HOME
ln $pdir/.Xresources $HOME
ln $pdir/.bashrc $HOME
echo ">Finished installation of dotfiles"
