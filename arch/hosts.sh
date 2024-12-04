#
# Import package bundles
#
source pkgs.sh

#
# Define host configurations
#
case $1 in
    T14 | apollo69)
	$pac $SYSTEM $AMDCPU $AMDGPU $BROWSERS $EDITORS $AUDIO $SWAY $LANGS
	$aur $SYSTEM_AUR $SWAY_AUR
	pip install neovim neovim-remote
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark
	systemctl --user enable --now emacs
	;;
esac
