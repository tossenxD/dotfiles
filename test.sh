#! /usr/bin/env bash

#
# Handle flags
#
let flags=0 # bitmask
while [ $# -gt 0 ]; do
    case $1 in
        -a | --arch) # Arch Linux install
            let flags=$(( flags|1 ))
            ;;
        -n | --nix) # NixOS install
            let flags=$(( flags|2 ))
            ;;
        -g | --git) # Clone Git repository (script is being curled)
            if test -z "$2" || test "$2" == -*; then
                printf "\
Invalid use of flag(s):\n\
\tDirectory must be specified after \`--git\`\ (\`-g\`).\n\
See \`--help\` (\`-h\`) for help.\n"
                exit 1
            fi
            gitdir="$(dirname $(realpath $0))/$2"
            if [ ! -d "$gitdir" ]; then
                printf "\'$gitdir\' is not a valid directory.\n"
                exit 1
            fi
            let flags=$(( flags|4 ))
            shift
            ;;
        -h | --help) # NixOS install
            printf "\
Valid flags includes:\n\
 \`--arch\` (\'-a\'):\n\
\tArch Linux install (mutually exclusive with \`--nix\`).\n\
 \`--nix\` (\`-n\`):\n\
\tNixOS install (mutually exclusive with \`--arch\`).\n\
 \`--git <directory>\` (-\`g <directory>\`):\n\
\tClones dotfile repository into /path/to/<directory> (useful with \`curl\`).\n\
\nDotfiles will always be installed.\n"
            exit 0
            ;;
        *) # Invalid flags
            printf "Invalid flag: \`$1\`. See \`--help\` (\`-h\`) for help.\n"
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
Invalid use of flag(s):\n\
\t\`--arch\` (\`-a\`) and \`--nix\` (\`-n\`) are mutually exclusive.\n\
See \`--help\` (\`-h\`) for help.\n"
    exit 1
fi

#
# Clone Git repository
#
if [ $(( flags & 4 )) -eq 4 ]; then
    if [ $(( flags & 2 )) -eq 2 ]; then
        nix shell nixpkgs#git --extra-experimental-features nix-command --extra-experimental-features flakes --command git clone https://github.com/tossenxD/dotfiles.git $gitdir/dotfiles
    else
        git clone https://github.com/tossenxD/dotfiles.git $gitdir/dotfiles
    fi
    gitdir=$gitdir/dotfiles
fi

#
# Install Arch Linux setup
#
if [ $(( flags & 1 )) -eq 1 ]; then
    $gitdir/.basic.sh
    $gitdir/.extras.sh
fi

#
# Install NixOS setup
#
if [ $(( flags & 2 )) -eq 2 ]; then
    #gitdir=git/
    #echo "$gitdir.nixos"
    #gitdir=$gitdir/dotfiles/
    #echo "$gitdir.nixos"
    sudo nixos-rebuild switch --flake $gitdir/.nixos --extra-experimental-features nix-command --extra-experimental-features flakes
fi

$gitdir/.dotfiles.sh
