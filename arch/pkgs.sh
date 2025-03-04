# Package bundles in the following format:
#     Packages are whitespace seperated and by default installed with pacman.
#     The package attribute `[AUR ...]` specifies packages `...` to be installed
#     from the Arch User Repository. The attribute `[CMD ...]` specifies a
#     command `...` to run after other packages have been installed.

SYSTEM="man-db man-pages neofetch cowsay vi nano tree plocate openssh wget sl \
    curl lm_sensors"
NETWORKMANAGER="\
    networkmanager [CMD sudo systemctl enable --now NetworkManager.service]"
MONITORING="btop rocm-smi-lib hddtemp mangohud"
AMDCPU="amd-ucode"
AMDGPU="mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon"
AUDIO="alsa-utils alsa-firmware pipewire pipewire-alsa"
BLUETOOTH="\
    bluez bluez-utils [CMD sudo systemctl enable --now bluetooth.service]"

SWAY="sway swaybg waybar xorg-xwayland wayland swappy grim slurp wl-clipboard \
    wofi [AUR workstyle-git]"
BSPWM="xorg xorg-xinit bspwm sxhkd nitrogen dmenu screengrab rofi xsel \
    ueberzug [AUR siji ttf-unifont polybar]"
KDE="plasma-meta kde-utilities-meta kde-system-meta kde-multimedia-meta \
    [CMD sudo systemctl enable sddm.service]"

FONTS="ttf-font-awesome ttf-liberation ttf-dejavu [AUR ttf-unifont]"
GNOMETHEMES="gnome-themes-extra [AUR adwaita-qt5-git adwaita-qt6-git] \
    [CMD gsettings set org.gnome.desktop.interface color-scheme prefer-dark]"

ALACRITTY="alacritty"
ZATHURA="zathura zathura-pdf-poppler"
FILEMANAGERS="dolphin ranger"
BROWSERS="firefox chromium"
OFFICE="libreoffice-fresh gimp"
BITTORRENT="qbittorrent"
NVIM="neovim"
EMACS="emacs [CMD sudo systemctl --user enable --now emacs]"
EMACSWAYLAND="emacs-wayland [CMD sudo systemctl --user enable --now emacs]"
VIRTUALBOX="virtualbox virtualbox-host-modules-arch"
DDDPRINT="openscad prusa-slicer [AUR cura-bin]"
SPOTIFY="[AUR spotify]"
DISCORD="discord"
MULTIMEDIA="mpv imv audacious"

HASKELL="ghc stack"
PYTHON="python python-pip"
LATEX="texlive-basic texlive-latex texlive-latexrecommended texlive-latexextra \
    texlive-mathscience texlive-frontsrecommended"
DEVUTILS="gdb valgrind cmark git nix npm nasm"

STEAM="steam ttf-liberation \
    [CMD sudo sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen] \
    [CMD sudo locale-gen]"
LUTRIS="lutris wine-staging giflib lib32-giflib gnutls lib32-gnutls v4l-utils \
    lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins \
    alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite \
    lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 \
    lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs \
    vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2"
MINECRAFT="[AUR minecraft-launcher]"

LOGITECH="solaar"
