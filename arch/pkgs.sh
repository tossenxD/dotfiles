#
# Packages
#
SYSTEM="man-db man-pages alacritty neofetch cowsays nautilus ranger zathura\
zathura-pdf-poppler otf-font-awesome gnome-themes-extra plocate qbittorrent openssh"
SYSTEM_AUR="ttf-unifont adwaita-qt5-git adwaita-qt6-git"
INTELCPU="intel-ucode"
AMDCPU="ampd-ucode"
AMDGPU="mesa xf86-video-amdgpu vulkan-radeon"
BROWSERS="firefox chromium"
EDITORS="emacs neovim libreoffice gimp"
AUDIO="alsa-utils alsa-firmware pulseaudio pulseaudio-alsa pulseaudio-jack pulsemixer pipewire"
SWAY="sway swaybg waybar xorg-xwayland wayland swappy grim slurp wl-clipboard wofi"
SWAY_AUR="workstyle-git"
BSPWM="xorg xorg-xinit bspwm sxhkd nitrogen dmenu screengrab rofi xsel ueberzug sxiv"
BSPWM_AUR="siji ttf-unifont polybar"
LANGS="python python-pip texlive-latexrecommended texlive-latexextra\
texlive-frontsrecommended cmark ghc"

#
# Commands
#
pac="sudo pacman -Syu --noconfirm"
aur="yay -S --noconfirm"
pip="pip install"

#
# Requires an AUR helper (yay)
#
if [[ -z $(pacman -Qi yay) ]]
   mkdir /tmp/build
   ( cd /tmp/build
     git clone https://aur.archlinux.org/yay.git
     cd /tmp/build/yay/
     makepkg -si --noconfirm
     cd $(dirname $(realpath $0)))
fi
