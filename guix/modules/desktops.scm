(define-module (modules desktops)
  #:export (desktop-sway-environment
            desktop-plasma-environment))

;; sway

;; TODO possibly no `workstyle` (used in sway config) -- first contribution?
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

(define desktop-sway-services
  '())

(define desktop-sway-environment
  (cons desktop-sway-packages desktop-sway-services))

;; plasma

(define desktop-plasma-packages
  '("plasma"))

(define desktop-plasma-services
  '())

(define desktop-plasma-environment
  (cons desktop-plasma-packages desktop-plasma-services))
