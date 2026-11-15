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
        (service home-xdg-user-directories-service-type)
        (simple-service 'nonguix-service
                        home-channels-service-type
                        (list
                         (channel
                          (name 'nonguix)
                          (url "https://gitlab.com/nonguix/nonguix")
                          (introduction
                           (make-channel-introduction
                            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
                            (openpgp-fingerprint
                             "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))))))

(define base-environment
  (cons base-packages base-services))
