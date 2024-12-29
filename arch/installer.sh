#
# Package installation handler with parameters PKGS and CMDS (see below)
#
applySystemConfiguration()
{
    PKGS=$1 # packages to install (see `pkgs.sh` for format)
    CMDS=$2 # commands to run in a comma-seperated string

    # Requries yay to be installed (or some other AUR manager)
    if [[ -z $(pacman -Qi yay) ]]
    then
       mkdir /tmp/build
       ( cd /tmp/build
         git clone https://aur.archlinux.org/yay.git
         cd /tmp/build/yay/
         makepkg -si --noconfirm
         cd $(dirname $(realpath $0)))
    fi

    # Requires multilib repository to be enabled
    if grep -q "#\\[multilib\\]" /etc/pacman.conf
    then
        n=$(grep -n "\\[multilib\\]" /etc/pacman.conf | cut -d: -f1)
        sudo sed -i ''$n's|#\[multilib\]|\[multilib\]|g' /etc/pacman.conf
        term="Include = /etc/pacman.d/mirrorlist"
        sudo sed -i ''$(expr $n + 1)"s|#$term|$term|g" /etc/pacman.conf
    fi

    # Run an awk program to process input
    { read -r pac; read -r aur; read -r cmds; } <<< \
        $(echo $PKGS | awk -v pac="" -v aur="" -v cmds="$CMDS" -F '[][]' '
{
    for (i = 1; i <= NF; i++)
    {
        split ($i, arr, " ");
        if (arr[1]=="AUR")
        {
            for (j = 2; j <= length(arr); j++)
            {
                aur = aur arr[j]" "
            }
        }
        else if (arr[1]=="CMD")
        {
            cmds = cmds","
            for (j = 2; j <= length(arr); j++)
            {
                cmds = cmds arr[j]" "
            }
        }
        else
        {
            for (j = 1; j <= length(arr); j++)
            {
                pac = pac arr[j]" "
            }
        }
    }
    print pac
    print aur
    print cmds
}')

    # Install packages
    sudo pacman -Syu --noconfirm $pac
    yay -S --noconfirm $aur

    # Run commands
    IFS=","
    for cmd in $cmds
    do
        unset IFS
        echo "$cmd"
        eval " $cmd"
        IFS=","
    done
    unset IFS
}
