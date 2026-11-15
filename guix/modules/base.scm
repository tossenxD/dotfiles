(define-module (modules base)
  #:use-module (gnu home services dotfiles)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services xdg)
  #:use-module (gnu home services guix)
  #:use-module (gnu services)
  #:use-module (guix channels)
  #:export (base-environment))

(define base-packages
  '("vim"
    "nano"

    "git"
    "bash"
    "network-manager"
    "openssh"
    "recutils"
    "man-db"
    "man-pages"
    "tree"
    "plocate"
    "wget"
    "curl"
    "gawk"
    "ncurses"
    "make"
    "zip"
    "unzip"
    "which"

    "elogind"

    "lm-sensors"
    "hddtemp"
    "btop"
    "htop"

    "font-liberation"
    "font-dejavu"
    "font-gnu-unifont"

    "sl"
    "cowsay"
    "fastfetch"))

(define base-services
  (list (service home-dotfiles-service-type
                 (home-dotfiles-configuration
                  (directories '("../../common/dotfiles" "../../common/scripts"))))
        (service home-dbus-service-type)
        (service home-xdg-user-directories-service-type)))

(define base-environment
  (cons base-packages base-services))
