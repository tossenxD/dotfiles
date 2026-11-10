(define-module (home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services dotfiles)
  #:use-module (gnu services)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  ;; local module definitions
  #:use-module (modules devutils)
  #:use-module (modules editors)
  #:use-module (modules desktops)
  #:use-module (modules office)
  #:use-module (modules benchutils)
  #:use-module (modules amdgpu)
  #:use-module (modules privacy)
  #:use-module (modules firmware)
  #:use-module (modules virtualizers)
  #:use-module (modules browsers))

(define base-packages
  '("vim"
    "nano"

    "git"
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

(define host-packages
  (letrec* ((hostname (gethostname))
            (hostname? (lambda (xs)
                         (cond ((null? xs) #f)
                               ((string=? hostname (car xs)) #t)
                               (else (hostname? (cdr xs)))))))
    (cond ((hostname? '("T14" "apollo69" "guixpad"))
           (append devutils-packages
                   editors-packages
                   desktop-sway-packages
                   office-packages
                   benchutils-packages
                   amdgpu-packages
                   amdgpgpu-packages
                   privacy-packages
                   firmware-packages
                   virtualizers-packages
                   browsers-packages))
          ((hostname? '("htpc"))
           (append desktop-plasma-packages
                   amdgpu-packages
                   privacy-packages
                   firmware-packages
                   browsers-packages))
          (else (throw 'missing-host hostname)))))

(home-environment
 (packages (specifications->packages (append base-packages
                                             host-packages)))
 (services
  (append (list (service home-dotfiles-service-type
                         (home-dotfiles-configuration
                          (directories '("../common/dotfiles" "../common/scripts")))))
          %base-home-services)))



;; TODO add service that checks for an existing wallpaper and creates a default if non are found
;; (also TODO, consider moving wallpaper from ~.wallpaper.png -> ~.config/.wallpaper.png
;;
;; e.g. take inspiration from:
;;
;; (list (service (home-files-service-type
;;   `(("scripts" ,(local0file "../common/foo" #:recursive? #t))))))





;; TODO Setup system configuration

;; TODO Setup channels

;; TODO Setup periodic garbage collection or alias

;; TODO embed home configuration in system configuration
;; (see https://guix.gnu.org/manual/devel/en/html_node/Guix-Services.html#guix_002dhome_002dservice_002dtype)

;; TODO tidal and discord package (nonguix)? Or maybe just use browser

;; TODO to microcode or not to microcode (nonguix)?

;; TODO steam+wifi on nonguix channel (what about minecraft and lutris?)
