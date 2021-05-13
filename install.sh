#!/bin/bash 
pdir=$(dirname $(realpath $0))

printf "\n>Change directory to ~/\n\n"
cd $HOME
printf "\n>Installing basic packages\n\n"
# Install basic packages
sudo pacman -Syu --noconfirm neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura zathura-pdf-poppler amd-ucode xf86-video-amdgpu man-db man-pages python python-pip xsel mlocate alsa-utils alsa-firmware pulseaudio pulseaudio-alsa pulseaudio-jack pulsemixer
pip install neovim

# Install yay
printf "\n>Make directory aur/ .trash/\n\n"
mkdir $HOME/aur $HOME/.trash
cd $HOME/aur
printf "\n>Install AUR package-manager yay from aur/\n\n"
git clone https://aur.archlinux.org/yay.git
cd $HOME/aur/yay/
makepkg -si --noconfirm
cd $HOME

# Install polybar
printf "\n>Using yay to install polybar\n\n"
yay -S --noconfirm siji ttf-unifont polybar

# Copy configurations
printf "\n>Change directory to ~/git/OS-configs\n\n"
cd $pdir
printf "\n>Copying all config files\n\n"
cp -r .colors/ $HOME
cp -r .config/ $HOME
cp .gitconfig $HOME
cp -r scripts/ $HOME
cp .xinitrc $HOME
cp .Xresources $HOME
cp .bashrc $HOME

printf "\n>Installation is over!\n"
