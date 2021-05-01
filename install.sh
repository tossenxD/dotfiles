cd ~/
# Install basic packages
sudo pacman -S neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura amd-ucode networkmanager network-manager-applet xf86-video-amdgpu man-db man-pages ttf-unifont siji-git

# Install yay
mkdir aur
cd aur
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ~/

# Install polybar
yay -S polybar siji ttf-unifont

# Copy configurations
cd ~/git/OS-configs
cp -r .colors/ ~/
cp -r .config/ ~/
cp .gitconfig ~/
cp -r scripts/ ~/
cp .xinitrc ~/
cp .Xresources ~/
cp .bashrc ~/
