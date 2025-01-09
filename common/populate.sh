#!/bin/sh

#
# Setup
#
if [ $1 = "-h" -o $1 = "--help" ]
then
    printf "\
Usage: $0 [OPTION] [HOST]
Populate a specified dotfile configuration to home directory of caller by
symbolic links. Configurations are defined on a hostname basis.

If HOST is empty, the hostname of the caller will be used instead.

Files are never lost linking nor unlinking.

OPTION can be one of the following:
  -h, --help      Print this help message
  -u, --unlink    Unlink the dotfiles
"
    exit 0
fi

mkdir -p $HOME/.config
PDIR=$(dirname $(realpath $0))

if [ $1 = "-u" -o $1 = "--unlink" ]
then
    UNLINK_P=1
    shift
fi

HOST=$1
if [ -z $HOST ]
then
    HOST="$(hostname -s)"
fi

#
# Specify configurations
#
case $HOST in
    T14 | apollo69)
        CONFIG=".config/sway .config/swappy .config/waybar .config/alacritty
                .config/wofi .config/workstyle .emacs.d .config/nvim
                .config/ranger .config/zathura .bashrc .bash_profile scripts"
        ;;

    legacy)
        CONFIG=".config/bspwm .config/polybar .config/sxhkd .config/icewm
                .config/nvim .config/ranger .config/zathura .bashrc .bash
                .xinitrc .Xresources .colors scripts"
        ;;

    *)
        printf "Could not find a dotfile configuration for host:\n  $HOST\n"
        exit 1
        ;;
esac

#
# Run linker or unlinker
#
for TARGET in $CONFIG
do
    SOURCE=$PDIR/$TARGET
    DEST=$HOME/$TARGET
    if [ -z $UNLINK_P ]
    then
        if [ -e $DEST  -a  "$(readlink -f -- $DEST)" != $SOURCE ]
        then
            echo "refuse to overwrite: $DEST"
        else
            ln -sf $SOURCE $DEST
            echo "linked: $SOURCE -> $DEST"
        fi
    else
        if [ -e $DEST  -a  "$(readlink -f -- $DEST)" != $SOURCE ]
        then
            echo "refuse to unlink: $DEST"
        else
            unlink $DEST
            echo "unlinked: $DEST"
        fi
    fi
done
