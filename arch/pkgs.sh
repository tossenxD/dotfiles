#!/bin/bash

# Package install
sudo pacman -Syu --noconfirm neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura zathura-pdf-poppler amd-ucode xf86-video-amdgpu man-db man-pages python python-pip xsel mlocate alsa-utils alsa-firmware pulseaudio pulseaudio-alsa pulseaudio-jack pulsemixer trash-cli ueberzug w3m sxiv python-pygments swappy grim slurp wl-clipboard otf-font-awesome sway swaybg wofi alacritty waybar xorg-xwayland wayland xdotool icewm pcmanfm rofi emacs cmark gnome-themes-extra texlive-most dotnet-runtime netofetch qbittorrent openssh

pip install neovim neovim-remote

# yay install
mkdir $HOME/aur
( cd $HOME/aur
  git clone https://aur.archlinux.org/yay.git
  cd $HOME/aur/yay/
  makepkg -si --noconfirm
  cd $(dirname $(realpath $0)))

# AUR package install
yay -S --noconfirm siji ttf-unifont polybar workstyle-git adwaita-qt5-git adwaita-qt6-git

# Settings
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
systemctl --user enable --now emacs
