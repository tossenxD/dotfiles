#
# Packages
#
SYSTEM="man-db man-pages alacritty neofetch cowsays nautilus ranger zathura\
zathura-pdf-poppler otf-font-awesome gnome-themes-extra plocate qbittorrent openssh"
AMDCPU="ampd-ucode"
AMDGPU="mesa xf86-video-amdgpu vulkan-radeon"
BROWSERS="firefox chromium"
EDITORS="emacs neovim libreoffice gimp"
AUDIO="alsa-utils alsa-firmware pulseaudio pulseaudio-alsa pulseaudio-jack pulsemixer pipewire"
SWAY="sway swaybg waybar xorg-xwayland wayland swappy grim slurp wl-clipboard wofi"
BSPWM="xorg xorg-xinit bspwm sxhkd nitrogen dmenu screengrab rofi xsel ueberzug sxiv"
LANGS="python python-pip texlive-latexrecommended texlive-latexextra\
texlive-frontsrecommended cmark ghc"

sudo pacman -Syu --noconfirm $SYSTEM $AMDCPU $AMDGPU $BROWSERS $EDITORS $AUDIO $SWAY $LANGS

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
