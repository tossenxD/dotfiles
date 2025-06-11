#!/bin/sh

#
# Define host configurations
#
matchToConfiguration()
{
    if [ $1 = "T14" -o $1 = "apollo69" ]
    then
        PKGS="\
$SYSTEM $NETWORKMANAGER $MONITORING $AMDCPU $AMDGPU $AUDIO $BLUETOOTH $FONTS \
$SWAY $ALACRITTY $FILEMANAGERS $EMACSWAYLAND $NVIM $BROWSERS $OFFICE $ZATHURA \
$BITTORRENT $DDDPRINT $VIRTUALBOX $SPOTIFY $DISCORD $MULTIMEDIA $STEAM \
$HASKELL $PYTHON $LATEX $DEVUTILS"
        CMDS="pip install neovim neovim-remote"
        CMDS=$CMDS",cp $PDIR/../common/wallpapers/archlinux.png ~/.wallpaper.png"

    elif [ $1 = "Gaia" ]
    then
        PKGS="\
$SYSTEM $AMDCPU $AMDGPU $NETWORKMANAGER $AUDIO $BLUETOOTH $KDE $FONTS \
$BROWSERS $OFFICE $DISCORD $STEAM $LUTRIS $MINECRAFT"

    else
        printf "\
Could not find an Arch Linux based package configuration for host: $HOST\n"
        exit 1
    fi
}

#
# Import package bundles and installation handle
#
PDIR=$(dirname $(realpath $0))
source $PDIR/pkgs.sh
source $PDIR/installer.sh

#
# Retrieve configuration based on input
#
HOST=$1
[ -z $HOST ] && HOST="$(hostname -s)"

matchToConfiguration $HOST

#
# Run installation handle
#
applySystemConfiguration "$PKGS" "$CMDS"
