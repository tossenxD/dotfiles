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

    alacritty
    lf
    zathura
    dolphin
    mpv
    imv))

(define desktop-plasma-packages
  '(plasma))
