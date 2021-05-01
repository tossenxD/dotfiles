printf "Change directory to ~/\n"
cd ~/
printf "Installing basic packages\n"
# Install basic packages
sudo pacman -S --noconfirm neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura amd-ucode networkmanager network-manager-applet xf86-video-amdgpu man-db man-pages

# Install yay
printf "Make directory aur/\n"
mkdir aur
cd aur
printf "Install AUR package-manager yay\n"
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ~/

# Install polybar
printf "Using yay to install polybar\n"
yay -S polybar siji ttf-unifont --mflags "--skipchecksums --skippgpcheck"

# Copy configurations
printf "Change directory to ~/git/OS-configs\n"
cd ~/git/OS-configs
printf "Copying all config files"
cp -r .colors/ ~/
cp -r .config/ ~/
cp .gitconfig ~/
cp -r scripts/ ~/
cp .xinitrc ~/
cp .Xresources ~/
cp .bashrc ~/
printf "Installation is over!"
