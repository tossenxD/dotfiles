#!/bin/sh

#
# Define host configurations
#
matchToConfiguration()
{
    if [ $1 = "T14" -o $1 = "apollo69" ]
    then
        PKGS="\
$SYSTEM $NETWORKMANAGER $MONITORING $AMDCPU $AMDGPU $AMDGPGPU $AUDIO \
$BLUETOOTH $FONTS $SWAY $ALACRITTY $FILEMANAGERS $EMACSWAYLAND $NVIM $BROWSERS \
$OFFICE $ZATHURA $BITTORRENT $DDDPRINT $VIRTUALBOX $MUSIC $DISCORD \
$MULTIMEDIA $STEAM $HASKELL $PYTHON $LATEX $DEVUTILS $ODD"
        CMDS="cp $PDIR/../common/wallpapers/archlinux.png ~/.wallpaper.png"

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
if [ -z "$HOST" ]
then
    ! $(pacman -Q inetutils &> /dev/null) && \
        echo "sudo pacman -Syu --noconfirm --needed inetutils" && \
        eval "sudo pacman -Syu --noconfirm --needed inetutils"
    HOST="$(hostname -s)"
fi

matchToConfiguration $HOST

#
# Run installation handle
#
applySystemConfiguration "$PKGS" "$CMDS"
