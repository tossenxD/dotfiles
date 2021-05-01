printf "\nChange directory to ~/\n\n"
cd ~/
printf "\nInstalling basic packages\n\n"
# Install basic packages
sudo pacman -S --noconfirm neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura amd-ucode networkmanager network-manager-applet xf86-video-amdgpu man-db man-pages

# Install yay
printf "\nMake directory aur/ downloads/ pictures/\n\n"
mkdir aur downloads
cd aur
printf "\nInstall AUR package-manager yay from aur/\n\n"
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm
cd ~/

# Install polybar
printf "\nUsing yay to install polybar\n\n"
yay -S --noconfirm polybar siji ttf-unifont

# Copy configurations
printf "\nChange directory to ~/git/OS-configs\n\n"
cd ~/git/OS-configs
printf "\nCopying all config files\n\n"
cp -r .colors/ ~/
cp -r .config/ ~/
cp .gitconfig ~/
cp -r scripts/ ~/
cp .xinitrc ~/
cp .Xresources ~/
cp .bashrc ~/
cp wallpaper.png ~/pictures/

# Set options
printf "\nSetting wallpaper\n\n"
nitrogen --set-auto --save ~/pictures/wallpaper.png
printf "\nEnabling NetworkManager\n\n"
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

printf "\nInstallation is over!\n"
