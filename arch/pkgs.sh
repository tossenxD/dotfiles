#
# Package bundles in the following format:
#     Packages are whitespace seperated and by default installed with pacman.
#     The package attribute `[AUR ...]` specifies packages `...` to be installed
#     from the Arch User Repository. The attribute `[CMD ...]` specifies a
#     command `...` to run after other packages have been installed.
#
SYSTEM="man-db man-pages alacritty neofetch cowsays nautilus ranger zathura \
zathura-pdf-poppler otf-font-awesome gnome-themes-extra plocate qbittorrent openssh \
[AUR ttf-unifont adwaita-qt5-git adwaita-qt6-git] \
[CMD gsettings set org.gnome.desktop.interface color-scheme prefer-dark]"
AMDCPU="amd-ucode"
AMDGPU="mesa xf86-video-amdgpu vulkan-radeon"
BROWSERS="firefox chromium"
EDITORS="libreoffice gimp"
AUDIO="alsa-utils alsa-firmware pulseaudio pulseaudio-alsa pulseaudio-jack pulsemixer pipewire"
SWAY="\
sway swaybg waybar xorg-xwayland wayland swappy grim slurp wl-clipboard wofi \
[AUR workstyle-git]"
BSPWM="\
xorg xorg-xinit bspwm sxhkd nitrogen dmenu screengrab rofi xsel ueberzug sxiv \
[AUR siji ttf-unifont polybar]"
NVIM="neovim [CMD pip install neovim neovim-remote]"
EMACS="emacs [CMD systemctl --user enable --now emacs]"
EMACSWAYLAND="emacs-wayland [CMD systemctl --user enable --now emacs]"
LANGS="python python-pip texlive-latexrecommended texlive-latexextra \
texlive-frontsrecommended cmark ghc"
