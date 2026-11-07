(define-module (guix home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu services)
  #:use-module (gnu packages admin)
  #:use-module (gnu gexp)
  ;; local module definitions
  #:use-module (guix modules devutils)
  #:use-module (guix modules editors)
  #:use-module (guix modules desktops)
  #:use-module (guix modules office)
  #:use-module (guix modules browsers))

(define base-packages
  '(vi
    vim
    nano
    git
    recutils
    fastfetch))

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
                   browsers-packages))
          ((hostname? '("htpc"))
           (append desktop-plasma-packages
                   browsers-packages))
          (else (throw 'missing-host hostname)))))

(home-environment
 (packages (append base-packages
                   host-packages))
 (services
  (append (list ())
          %base-home-services)))






;; TODO Setup system configuration

;; TODO Setup channels

;; TODO Make multiple profiles (i.e. htpc, lightweight, gaming, etc.)

;; TODO Setup periodic garbage collection or alias

;; TODO remember GCC toolchain

;; TODO if `clear` does not work after install, try installing `ncurses`
;;      (or alias `printf '\e[2J\e[H'`)

;; TODO possible no `workstyle` -- first contribution?

;; TODO embed home configuration in system configuration
;; (see https://guix.gnu.org/manual/devel/en/html_node/Guix-Services.html#guix_002dhome_002dservice_002dtype)
