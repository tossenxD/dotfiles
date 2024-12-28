#
# Import package bundles and installation handle
#
path=$(dirname $(realpath $0))
source $path/pkgs.sh
source $path/installer.sh

#
# Define host configurations
#
if [ -z $1 ]
then
    printf "[ERR] Missing hostname for Arch Linux based package installation.\n"
    exit 1
fi
case $1 in
    T14 | apollo69)
        PKGS="$SYSTEM $AMDCPU $AMDGPU $BROWSERS $EDITORS $AUDIO $SWAY $LANGS"
        CMDS="pip install neovim neovim-remote"
        ;;
    Gaia)
        PKGS="BROWSERS"
        ;;
    *)
        printf "\
[ERR] Undefined setup of Arch Linux based package configurations for hostname:\n
      $1\n"
        exit 1
        ;;
esac

#
# Run installation handle
#
applySystemConfiguration $PKGS $CMDS
