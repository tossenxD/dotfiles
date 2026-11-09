(define-module (modules desktops)
  #:export (desktop-sway-packages
            desktop-plasma-packages))

(define desktop-sway-packages
  '("sway"
    "swaybg"
    "swaylock"
    "waybar"
    "wayland"
    "xorg-server-xwayland"
    "xdg-utils"
    "swappy"
    "grim"
    "slurp"
    "wl-clipboard"
    "wofi"

    "pipewire"
    "alsa-utils"
    "pulsemixer"
    "bluez"

    "libcdio"
    "libdvdread"
    "libdvdcss"
    "libdvdnav"
    "audiocd-kio"

    "alacritty"
    "lf"
    "zathura"
    "dolphin"
    "mpv"
    "imv"))

(define desktop-plasma-packages
  '("plasma"))
