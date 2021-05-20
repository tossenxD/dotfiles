#!/bin/bash 
echo ">Beginning basic installation"

echo ">Installing pacman packages"
# Package install
sudo pacman -Syu --noconfirm neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura zathura-pdf-poppler amd-ucode xf86-video-amdgpu man-db man-pages python python-pip xsel mlocate alsa-utils alsa-firmware pulseaudio pulseaudio-alsa pulseaudio-jack pulsemixer
pip install neovim

# yay install
echo ">Installing yay"
cd $HOME/aur
git clone https://aur.archlinux.org/yay.git
cd $HOME/aur/yay/
makepkg -si --noconfirm

# polybar install
echo ">Installing polybar"
yay -S --noconfirm siji ttf-unifont polybar

# Home setup
echo ">Setting up home"
mkdir $HOME/aur $HOME/pictures $HOME/trash $HOME/backups

echo ">Finished basic installation"
