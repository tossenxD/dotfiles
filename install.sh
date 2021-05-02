printf "\n>Change directory to ~/\n\n"
cd ~/
printf "\n>Installing basic packages\n\n"
# Install basic packages
sudo pacman -Syu --noconfirm neovim bspwm sxhkd rxvt-unicode dmenu xorg xorg-xinit nitrogen firefox nautilus ranger screengrab zathura amd-ucode xf86-video-amdgpu man-db man-pages python python-pip xsel mlocate
pip install neovim

# Install yay
printf "\n>Make directory aur/\n\n"
mkdir aur
cd aur
printf "\n>Install AUR package-manager yay from aur/\n\n"
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm
cd ~/

# Install polybar
printf "\n>Using yay to install polybar\n\n"
yay -S --noconfirm siji ttf-unifont polybar

# Copy configurations
printf "\n>Change directory to ~/git/OS-configs\n\n"
cd ~/git/OS-configs
printf "\n>Copying all config files\n\n"
cp -r .colors/ ~/
cp -r .config/ ~/
cp .gitconfig ~/
cp -r scripts/ ~/
cp .xinitrc ~/
cp .Xresources ~/
cp .bashrc ~/

printf "\n>Installation is over!\n"
