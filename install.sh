#! /usr/bin/env bash

# To run this install script remote, use:
#
# $ curl -sL https://raw.githubusercontent.com/tossenxD/dotfiles/master/install.sh | bash -s -- [ <flags>* ]
#

#
# Handle flags
#
let flags=0 # bitmask
while [ $# -gt 0 ]; do
    case $1 in
        -a | --arch)
            let flags=$(( flags|1 ))
            ;;
        -n | --nix)
            let flags=$(( flags|2 ))
            if test ! -z "$2" && test ! "$2$" == -*; then
                nconf="$2"
                shift
            fi
            ;;
        -g | --git)
            if test -z "$2" || test "$2" == -*; then
                printf "\
[ERR] Directory must be specified after [ -g | --git ].
      See [ -h | --help ] for help.\n"
                exit 1
            fi
            gitdir="$(dirname $(realpath $0))/$2"
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
if [ $(( flags & 4 )) -eq 4 ]; then
    if [ $(( flags & 2 )) -eq 2 ]; then
        nix shell nixpkgs#git --extra-experimental-features 'nix-command flakes' --command git clone https://github.com/tossenxD/dotfiles.git $gitdir/dotfiles
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
fi

#
# Install NixOS setup
#
if [ $(( flags & 2 )) -eq 2 ]; then
    nix shell nixpkgs#git --extra-experimental-features 'nix-command flakes' --command sudo nixos-rebuild switch --flake $gitdir/nixos#$nconf --impure
    printf "\
[NOTE] Remember to ensure existance of a valid user before reboot, e.g by
 $ useradd <username>
 $ passwd <username>\n"
fi

#
# Populate dotfiles
#
$gitdir/common/populate.sh
