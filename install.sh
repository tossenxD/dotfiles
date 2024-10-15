#! /usr/bin/env bash

# To run this install script remote, use:
# $ curl -sL https://raw.githubusercontent.com/tossenxD/dotfiles/master/install.sh | bash -s -- [ <flags>* ]

#
# Handle flags
#
gitdir=$(dirname $(realpath $0))  # calling directory
let flags=0                       # bitmask
while [ $# -gt 0 ]; do
    case $1 in
        -a | --arch)
            let flags=$(( flags|1 ))
            ;;
        -n | --nix)
            let flags=$(( flags|2 ))
            if [[ ! -z "$2" && ! "$2$" == -* ]]; then
                host="$2"
                shift
            else
                host="$(hostname -s)"
            fi
            ;;
        -g | --git)
            if [[ -z "$2" || "$2" == -* ]]; then
                printf "\
[ERR] Directory must be specified after [ -g | --git ].
      See [ -h | --help ] for help.\n"
                exit 1
            fi
            gitdir="$gitdir/$2"
            if [ ! -d "$gitdir" ]; then
                printf "\
[ERR] Directory \'$gitdir\' does not exist.
      See [ -h | --help ] for help.\n"
                exit 1
            fi
            let flags=$(( flags|4 ))
            shift
            ;;
        -h | --help)
            printf "\
Valid flags:
 [ -a | --arch ]:
\tArch Linux install Mutually exclusive with [ -n | --nix ].
\n [ -n [ <flake-conf> ] | --nix [ <flake-conf> ] ]:
\tNixOS install of configuration <flake-conf> (hostname if not specified).
\tMutually exclusive with [ -a | --arch ].
\n [ -g <directory> | --git <directory> ]:
\tClones dotfile repository into /path/to/<directory> using Git.
\nDotfiles will always be populated.\n"
            exit 0
            ;;
        *) # Invalid flags
            printf "\
[ERR] Invalid argument \'$1\'.
      See [ -h | --help ] for help.\n"
            exit 1
            ;;
    esac
    shift
done

#
# Further sanitize flags
#
if [ $(( flags & 3 )) -eq 3 ]; then
    printf "\
[ERR] Flags [ -a | --arch ] and [ -n | --nix ] are mutually exclusive.
      See [ -h | --help ] for help.\n"
    exit 1
fi

#
# Clone Git repository
#
nixgit="nix shell nixpkgs#git --extra-experimental-features nix-command \
                              --extra-experimental-features flakes --command"
if [ $(( flags & 4 )) -eq 4 ]; then
    if [ $(( flags & 2 )) -eq 2 ]; then
        $nixgit git clone https://github.com/tossenxD/dotfiles.git\
                $gitdir/dotfiles
    else
        git clone https://github.com/tossenxD/dotfiles.git $gitdir/dotfiles
    fi
    gitdir=$gitdir/dotfiles
fi

#
# Install Arch Linux setup
#
if [ $(( flags & 1 )) -eq 1 ]; then
    $gitdir/arch/pkgs.sh
    cp $gitdir/common/wallpapers/archlinux.png ~/.wallpaper.png
fi

#
# Install NixOS setup
#
if [ $(( flags & 2 )) -eq 2 ]; then
    if [[ -z $(cat $gitdir/nixos/flake.nix | grep "$host = lib.nixosSystem") ]];
    then
        printf "\
[ERR] Host $host does not exists in NixOS flake; add manually.
      See [ -h | --help ] for help.\n"
        exit 1
    fi
    ( # If hardware-file for <hostname> is missing, create and commit it
        cd $gitdir/nixos/hosts/
        hwfile="hardware-configuration-$host.nix"
        if [ ! -f "$hwfile" ]; then
            cp /etc/nixos/hardware-configuration.nix $hwfile
            $nixgit git add $hwfile
        fi
    )
    $nixgit sudo nixos-rebuild switch --flake $gitdir/nixos#$host
    printf "\
[NOTE] Remember to ensure existance of a valid user before reboot, e.g by
 $ useradd <username>
 $ passwd <username>\n"
    cp $gitdir/common/wallpapers/nixosrainbow.png ~/.wallpaper.png
fi

#
# Populate dotfiles
#
$gitdir/common/populate.sh
