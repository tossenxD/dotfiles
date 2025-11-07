# Package bundles in the following format:
#     Packages are whitespace seperated and by default installed with pacman.
#     The package attribute `[AUR ...]` specifies packages `...` to be installed
#     from the Arch User Repository. The attribute `[CMD ...]` specifies a
#     command `...` to run after other packages have been installed.

SYSTEM="man-db man-pages fastfetch cowsay vi nano tree plocate openssh wget sl \
    curl lm_sensors [CMD sudo sensors-detect --auto]"
NETWORKMANAGER="\
    networkmanager [CMD sudo systemctl enable --now NetworkManager.service]"
MONITORING="btop rocm-smi-lib hddtemp mangohud glmark2"
AMDCPU="amd-ucode"
AMDGPU="mesa lib32-mesa mesa-utils xf86-video-amdgpu vulkan-radeon \
    lib32-vulkan-radeon vulkan-mesa-layers lib32-vulkan-mesa-layers"
AMDGPGPU="opencl-mesa lib32-opencl-mesa rocm-opencl-runtime"
AUDIO="alsa-utils alsa-firmware pipewire pipewire-alsa pipewire-pulse\
    [CMD systemctl --user enable --now pipewire-pulse.service]"
BLUETOOTH="\
    bluez bluez-utils [CMD sudo systemctl enable --now bluetooth.service]"
ODD="libcdio audiocd-kio libdvdread libdvdcss libdvdnav"

SWAY="sway swaybg waybar xorg-xwayland wayland swappy grim slurp wl-clipboard \
    wofi [AUR workstyle-git]"
BSPWM="xorg xorg-xinit bspwm sxhkd nitrogen dmenu screengrab rofi xsel \
    ueberzug [AUR siji ttf-unifont polybar]"
KDE="plasma-meta kde-utilities-meta kde-system-meta kde-multimedia-meta \
    [CMD sudo systemctl enable sddm.service]"

FONTS="nerd-fonts ttf-liberation ttf-dejavu [AUR ttf-unifont]"
GNOMETHEMES="gnome-themes-extra [AUR adwaita-qt5-git adwaita-qt6-git] \
    [CMD gsettings set org.gnome.desktop.interface color-scheme prefer-dark]"

ALACRITTY="alacritty"
ZATHURA="zathura zathura-pdf-poppler"
FILEMANAGERS="dolphin ranger"
BROWSERS="firefox chromium [AUR librewolf-bin]"
OFFICE="libreoffice-fresh gimp"
VPN="proton-vpn-gtk-app"
BITTORRENT="qbittorrent "$VPN
NVIM="neovim python-pynvim"
EMACSCOMMON="aspell aspell-en aspell-da \
    [CMD systemctl --user enable --now emacs]"
EMACS="emacs "$EMACSCOMMON
EMACSWAYLAND="emacs-wayland "$EMACSCOMMON
VIRTUALBOX="virtualbox virtualbox-host-modules-arch"
DDDPRINT="openscad inkscape prusa-slicer"
MUSIC="spotify-launcher [AUR tidal-hifi-bin]"
DISCORD="discord"
MULTIMEDIA="mpv imv audacious"

HASKELL="ghc stack"
PYTHON="python python-pip"
LATEX="texlive-basic texlive-latex texlive-latexrecommended texlive-latexextra \
    texlive-mathscience texlive-fontsrecommended"
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
