#!/bin/sh

#
# Import package bundles and installation handle
#
PDIR=$(dirname $(realpath $0))
source $PDIR/pkgs.sh
source $PDIR/installer.sh

#
# Define host configurations
#
HOST=$1
if [ -z $HOST ]
then
    HOST="$(hostname -s)"
fi

case $HOST in
    T14 | apollo69)
        PKGS="\
$SYSTEM $NETWORKMANAGER $MONITORING $AMDCPU $AMDGPU $AUDIO $BLUETOOTH $FONTS \
$SWAY $ALACRITTY $FILEMANAGERS $EMACSWAYLAND $NVIM $BROWSERS $OFFICE $ZATHURA \
$BITTORRENT $DDDPRINT $VIRTUALBOX $SPOTIFY $DISCORD $MULTIMEDIA $STEAM \
$HASKELL $PYTHON $LATEX $DEVUTILS"
        CMDS="pip install neovim neovim-remote"
        ;;

    Gaia)
        PKGS="\
$SYSTEM $AMDCPU $AMDGPU $NETWORKMANAGER $AUDIO $BLUETOOTH $KDE $FONTS \
$BROWSERS $OFFICE $DISCORD $STEAM $LUTRIS $MINECRAFT"
        ;;

    *)
        printf "\
[ERR] Undefined setup of Arch Linux based package configurations for hostname:
      $HOST\n"
        exit 1
        ;;
esac

#
# Run installation handle
#
applySystemConfiguration "$PKGS" "$CMDS"
