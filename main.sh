#!/bin/sh

#
# Handle flags
#
DIR=$(dirname $(realpath $0))  # calling directory
let FLAGS=0                    # bitmask
while [ $# -gt 0 ]
do
    if [ $1 = "-a" -o $1 = "--arch" ]
    then
        let FLAGS=$(( FLAGS|1 )) # bit 1

    elif [ $1 = "-n" -o $1 = "--nix" ]
    then
         let FLAGS=$(( FLAGS|2 )) # bit 2

    elif [ $1 = "-g" -o $1 = "--git" ]
    then
        let FLAGS=$(( FLAGS|4 )) # bit 3
        if [ -z "$2" ] || [ $(echo $2 | cut -c1) = "-" ]
        then
            printf "\
Missing directory argument after -g, --git.
See -h, --help for help.\n"
            exit 1
        fi
        DIR="$DIR/$2"
        shift

    elif [ $1 = "-l" -o $1 = "--link" -o $1 = "-u" -o $1 = "--unlink" ]
    then
        let FLAGS=$(( FLAGS|8 )) # bit 4
        [ $1 = "-u" -o $1 = "--unlink" ] && export UNLINK_P=1

    elif [ $1 = "-d" -o $1 = "--dry" ]
    then
        export DRYRUN_P=1

    elif [ $1 = "-h" -o $1 = "--help" ]
    then
        printf "\
Usage: $0 [OPTION]... [HOST]
Install and apply OS configurations for Arch Linux or NixOS, and populate
dotfiles (OS-agnostic package configuration files) to callers home directory.

If HOST is empty, the hostname of the caller will be used instead.

Installation of OS configurations are mutually exclusive.

Files are never lost upon populating the dotfiles.

OPTION can be one of the following:
  -a, --arch         Arch Linux installation of configuration HOST.
  -n, --nix          NixOS installion of configuration flake HOST.
  -g, --git  DIR     Clone the configuration repository using git-clone DIR.
  -l, --link         Populate package configuration files (dotfiles) of HOST.
  -u, --unlink       Depopulate package configuration files (dotfiles) of HOST.
  -d, --dry          Executions are instead printed to stdout (except --git).
  -h  --help         Prints this message.\n"
        exit 0

    elif [ $(echo $1 | cut -c1) = "-" ]
    then
        printf "\
Unrecognized flag: $1
See -h, --help for help.\n"
        exit 1

    else
        if [ ! -z "$2" ]
        then
            printf "\
Invalid argument: $2
See -h, --help for help.\n"
            exit 1
        fi
        HOST="$1"
    fi
    shift
done

#
# Further sanitize flags
#
if [ $(( FLAGS & 3 )) -eq 3 ]
then
    printf "\
Flags -a, --arch and -n, --nix are mutually exclusive.
See -h, --help for help.\n"
    exit 1
fi

[ -z "$HOST" ] && HOST="$(hostname -s)"

[ $(( FLAGS & 2 )) -eq 2 ] && GIT_ENV=$(echo "nix shell nixpkgs#git \
                       --extra-experimental-features nix-command \
                       --extra-experimental-features flakes --command " | xargs)

#
# Clone Git repository
#
if [ $(( FLAGS & 4 )) -eq 4 ]
then
    GIT_URL="https://github.com/tossenxD/dotfiles.git"
    DEFAULT_DIR_NAME=$(echo $GIT_URL | rev | cut -d/ -f1 | rev | cut -d. -f1)
    [ -d $DIR ] && DIR=$DIR/$DEFAULT_DIR_NAME
    echo "$GIT_ENV git clone $GIT_URL $DIR" | xargs
    (! $GIT_ENV git clone $GIT_URL $DIR) && exit 1
fi

#
# Install Arch Linux setup
#
if [ $(( FLAGS & 1 )) -eq 1 ]
then
    if ! grep -q "$HOST" $DIR/arch/hosts.sh
    then
        printf "\
Could not find a Arch Linux configuration for host: $HOST
To add a configuration of the host visit file: $DIR/arch/hosts.sh
See -h, --help for help.\n"
        exit 1
    fi
    $DIR/arch/hosts.sh $HOST
fi

#
# Install NixOS setup
#
if [ $(( FLAGS & 2 )) -eq 2 ]
then
    if ! grep -q "$HOST = lib.nixosSystem" $DIR/nixos/flake.nix
    then
        printf "\
Could not find a NixOS flake for host: $HOST
To add a configuration of the host visit file: $DIR/nixos/flake.nix
See -h, --help for help.\n"
        exit 1
    fi
    ( # If hardware-file for HOST is missing, create and commit it
        cd $DIR/nixos/hosts/
        HWFILE="hardware-configuration-$HOST.nix"
        if [ ! -f "$HWFILE" ]
        then
            echo "> generating $HWFILE"
            [ -z $DRYRUN_P ] && cp /etc/nixos/hardware-configuration.nix $HWFILE
            [ -z $DRYRUN_P ] && $GIT_ENV git add $HWFILE
        fi
    )
    echo "$GIT_ENV sudo nixos-rebuild switch --flake $DIR/nixos#$HOST"
    [ -z $DRYRUN_P ] && \
        $GIT_ENV sudo nixos-rebuild switch --flake $DIR/nixos#$HOST
    printf "\
Ensure existance of a valid user before reboot e.g by running
> $ useradd USERNAME
> $ passwd USERNAME\n"
    [ -z $DRYRUN_P ] && \
        echo "cp $DIR/common/wallpapers/nixosrainbow.png ~/.wallpaper.png" && \
        cp $DIR/common/wallpapers/nixosrainbow.png ~/.wallpaper.png
fi

#
# Populate dotfiles
#
[ $(( FLAGS & 8 )) -eq 8 ] && $DIR/common/populate.sh $HOST
