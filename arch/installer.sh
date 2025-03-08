#
# Package installation handler with parameters PKGS and CMDS (see below)
#
applySystemConfiguration()
{
    PKGS=$1 # packages to install (see `pkgs.sh` for format)
    CMDS=$2 # commands to run in a comma-seperated string

    # Requires base to be installed
    ! $(pacman -Q base >> dev/null) && echo "sudo pacman -Syu base" && \
        [ -z $DRYRUN_P ] && sudo pacman -Syu base

    # Requries yay to be installed
    if [ -z $DRYRUN_P ] && ! pacman -Q yay
    then
        echo "> building yay"
        mkdir /tmp/build
       ( cd /tmp/build
         git clone https://aur.archlinux.org/yay.git
         cd /tmp/build/yay/
         makepkg -si --noconfirm
         cd $(dirname $(realpath $0)))
    fi

    # Requires multilib repository to be enabled
    if [ -z $DRYRUN_P ] && grep -q "#\\[multilib\\]" /etc/pacman.conf
    then
        N=$(grep -n "\\[multilib\\]" /etc/pacman.conf | cut -d: -f1)
        echo "sudo sed -i ''$N's|#\[multilib\]|\[multilib\]|g' /etc/pacman.conf"
        sudo sed -i ''$N's|#\[multilib\]|\[multilib\]|g' /etc/pacman.conf
        TERM="Include = /etc/pacman.d/mirrorlist"
        echo "sudo sed -i ''$(expr $N + 1)\"s|#$TERM|$TERM|g\" /etc/pacman.conf"
        sudo sed -i ''$(expr $N + 1)"s|#$TERM|$TERM|g" /etc/pacman.conf
    fi

    # Run an awk program to process input
    { read -r PAC; read -r AUR; read -r CMDS; } <<< \
        $(echo $PKGS | awk -v PAC="" -v AUR="" -v CMDS="$CMDS" -F '[][]' '
{
    for (i = 1; i <= NF; i++)
    {
        split ($i, arr, " ");
        if (arr[1]=="AUR")
        {
            for (j = 2; j <= length(arr); j++)
            {
                AUR = AUR arr[j]" "
            }
        }
        else if (arr[1]=="CMD")
        {
            CMDS = CMDS","
            for (j = 2; j <= length(arr); j++)
            {
                CMDS = CMDS arr[j]" "
            }
        }
        else
        {
            for (j = 1; j <= length(arr); j++)
            {
                PAC = PAC arr[j]" "
            }
        }
    }
    print PAC
    print AUR
    print CMDS
}')

    # Install packages
    echo "sudo pacman -Syu --noconfirm $PAC"
    [ -z $DRYRUN_P ] && sudo pacman -Syu --noconfirm $PAC
    echo "yay -S --noconfirm $AUR"
    [ -z $DRYRUN_P ] && yay -S --noconfirm $AUR

    # Run commands
    IFS=","
    for CMD in $CMDS
    do
        unset IFS
        echo "$CMD"
        [ -z $DRYRUN_P ] && eval " $CMD"
        IFS=","
    done
    unset IFS
}
