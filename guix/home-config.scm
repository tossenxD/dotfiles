(define-module (home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu services)
  #:use-module (gnu packages)
  ;; local module definitions
  #:use-module (modules devutils)
  #:use-module (modules editors)
  #:use-module (modules desktops)
  #:use-module (modules office)
  #:use-module (modules benchutils)
  #:use-module (modules amdgpu)
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

    "lm-sensors"
    "hddtemp"
    "btop"
    "htop"

    "sl"
    "cowsay"
    "fastfetch"))

(define host-packages
  (letrec* ((hostname (gethostname))
            (hostname? (lambda (xs)
                         (cond ((null? xs) #f)
                               ((string=? hostname (car xs)) #t)
                               (else (hostname? (cdr xs)))))))
    (cond ((hostname? '("T14" "apollo69"))
           (append devutils-packages
                   editors-packages
                   desktop-sway-packages
                   office-packages
                   benchtils-packages
                   amdgpu-packages
                   amdgpgpu-packages
                   browsers-packages))
          ((hostname? '("htpc" "guixpad"))
           (append desktop-plasma-packages
                   amdgpu-packages
                   browsers-packages))
          (else (throw 'missing-host hostname)))))

(home-environment
 (packages (specifications->packages (append base-packages
                                             host-packages)))
 (services
  (append (list)
          %base-home-services)))






;; TODO Setup system configuration

;; TODO Setup channels

;; TODO Setup periodic garbage collection or alias

;; TODO possible no `workstyle` -- first contribution?

;; TODO embed home configuration in system configuration
;; (see https://guix.gnu.org/manual/devel/en/html_node/Guix-Services.html#guix_002dhome_002dservice_002dtype)

;; TODO to microcode or not to microcode?

;; TODO add fonts and themes

;; TODO add vpn and torrent clients

;; TODO find out if virtualbox and qemu is needed on guix

;; TODO tidal and discoard package? Or maybe just use browser

;; TODO steam and nonguix channel (what about minecraft and lutris?)

;; TODO logitech mx3 mouse "solaar", look into
