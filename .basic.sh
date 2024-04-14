#!/bin/bash
echo ">Beginning basic installation"

echo ">Installing packages"
# Package install
sudo pacman -Syu --noconfirm neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura zathura-pdf-poppler amd-ucode xf86-video-amdgpu man-db man-pages python python-pip xsel mlocate alsa-utils alsa-firmware pulseaudio pulseaudio-alsa pulseaudio-jack pulsemixer trash-cli ueberzug w3m sxiv python-pygments swappy grim slurp wl-clipboard otf-font-awesome sway swaybg wofi alacritty waybar xorg-xwayland wayland xdotool icewm pcmanfm rofi emacs cmark gnome-themes-extra
pip install neovim neovim-remote

# Home setup
echo ">Setting up home"
mkdir $HOME/aur $HOME/pictures

# yay install
echo ">Installing yay"
cd $HOME/aur
git clone https://aur.archlinux.org/yay.git
cd $HOME/aur/yay/
makepkg -si --noconfirm

# AUR package install
echo ">Installing AUR packages"
yay -S --noconfirm siji ttf-unifont polybar workstyle-git adwaita-qt5-git adwaita-qt6-git

echo ">Finished basic installation"
