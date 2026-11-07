(define-module (guix modules desktops)
  #:export desktop-sway-packages
  #:export desktop-plasma-packages)

(define desktop-sway-packages
  '(sway
    waybar
    swaybg
    wayland
    xorg-server-xwayland
    swappy
    grim
    slurp
    wl-clipboard
    wofi

    pipewire
    alsa-utils
    bluez

    libcdio
    libdvdread
    libdvdcss
    libdvdnav
    audiocd-kio

    alacritty
    lf
    zathura
    dolphin
    mpv
    imv))

(define desktop-plasma-packages
  '(plasma))
