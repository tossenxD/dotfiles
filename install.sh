cd ~/
# Install basic packages
sudo pacman -S neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura amd-ucode networkmanager network-manager-applet xf86-video-amdgpu man-db man-pages texinfo

# Install yay
mkdir aur
cd aur
git clone https://aur.archlinux.ord/yay-git.git
cd yay-git/
makepkg -si
cd ~/

# Install polybar
yay -S polybar

# Copy configurations
cd ~/git/OS-configs
cp -r .colors/ ~/
cp -r .config/ ~/
cp .gitconfig ~/
cp -r scripts/ ~/
cp .xinitrc ~/
cp .Xresources ~/
