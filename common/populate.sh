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

OPTION can be one of the following:
  -h, --help      Print this help message
  -c, --clear     Unlink the dotfiles
"
    exit 0
fi

mkdir -p $HOME/.config
PDIR=$(dirname $(realpath $0))

CLEAR=0
if [ $1 = "-c" -o $1 = "--clear" ]
then
    CLEAR=1
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
        ;;

    legacy)
        ln -sf $PDIR/.config/bspwm $HOME/.config
        ln -sf $PDIR/.config/polybar $HOME/.config
        ln -sf $PDIR/.config/sxhkd $HOME/.config

        ln -sf $PDIR/.config/icewm $HOME/.config

        ln -sf $PDIR/.xinitrc $HOME
        ln -sf $PDIR/.Xresources $HOME
        ln -sf $PDIR/.colors $HOME
        ;;

    *)
        printf "\
Undefined dotfile configuration for host:
  $HOST
"
        exit 1
        ;;
esac

#
# Run main program
#
