#!/bin/sh

# This program can both link and unlink files specified relative to the program.
# See -h, --help for usage and explanation. A *dotfile configuration* is a
# string of space-seperated filenames. The value of variable CONFIG at eof is
# the dotfile configuration that will be linked or unlinked. Lastly, this
# program takes a conservative approach meaning that data will never be lost.

#
# Define configurations
#
matchToConfiguration()
{
    if [ $1 = "T14" -o $1 = "apollo69" ]
    then
        CONFIG="
.config/sway .config/swappy .config/waybar .config/alacritty .config/wofi
.config/workstyle .emacs.d .config/nvim .config/ranger .config/zathura .bashrc
.bash_profile scripts"

    elif [ $1 = "legacy" ]
    then
        CONFIG="
.config/bspwm .config/polybar .config/sxhkd .config/icewm .config/nvim
.config/ranger .config/zathura .bashrc .xinitrc .Xresources .colors scripts"

    else
        printf "Could not find a dotfile configuration for host:\n  $HOST\n"
        exit 1
    fi
}

#
# Handle input
#
if [ $1 = "-h" -o $1 = "--help" ]
then
    printf "\
Usage: $0 [OPTION] [HOST]
Populate a specified dotfile configuration to the home directory of the caller
by means of symbolic linkage. Configurations are defined on a hostname basis.

If HOST is empty, the hostname of the caller will be used instead.

Files are never lost linking nor unlinking.

OPTION can be one of the following:
  -h, --help      Print this help message.
  -u, --unlink    Unlink the dotfiles.\n"
    exit 0
fi

mkdir -p $HOME/.config
PDIR=$(dirname $(realpath $0))

[ $1 = "-u" -o $1 = "--unlink" ] && UNLINK_P=1 && shift

HOST=$1 && [ -z $HOST ] && HOST="$(hostname -s)"

matchToConfiguration $HOST

#
# Run (un)linker
#
for TARGET in $CONFIG
do
    SOURCE=$PDIR/$TARGET
    DEST=$HOME/$TARGET
    if [ ( ( ! -z $UNLINK_P ) -a ( ! -e $DEST ) ) -o \
         ( ( -e $DEST ) -a ( $(readlink -f -- $DEST) != $SOURCE ) ) ]
    then
        if [ -z $UNLINK_P ]
        then
            printf "refuse to overwrite:\n> $DEST\n"
        else
            printf "refuse to unlink:\n> $DEST\n"
        fi
    else
        if [ -z $UNLINK_P ]
        then
            [ -z $DRYRUN_P ] && ln -sf $SOURCE $DEST
            printf "linked:\n> $SOURCE -> $DEST\n"
        else
            [ -z $DRYRUN_P ] && unlink $DEST
            printf "unlinked:\n> $DEST <- $SOURCE\n"
        fi
    fi
done
